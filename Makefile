.PHONY: intellij clean build publish buf-breaking buf-lint api-lint default-protobuf-dependencies \
	protodocs protodocs-clean clean-common-protos generate typescript-generate protoc-gen-validate-dependency\
	json-schema

# =======================
# Variables
# =======================
pwd := $(shell pwd)
protos_dir := ${CURDIR}/protos
proto_files := $(shell find "${pwd}/protos/strmprivacy" -name *.proto)
public_proto_files := $(shell find "${pwd}/protos/strmprivacy/api" -name *.proto)
relative_proto_files := $(shell find "protos/strmprivacy" -name *.proto)
common_protos := ${CURDIR}/lang/.common-protos
common_proto_files := $(shell find "${common_protos}" -name *.proto)
git_sha := $(shell git rev-parse --short HEAD)
git_branch := $(shell git rev-parse --abbrev-ref HEAD)
entities_protos := $(shell find ${pwd}/protos/strmprivacy/api -name entities*.proto)

export

# =======================
# Versions and dependencies
# =======================
strmprivacy_api_version := 3.18.3

grpc_version := 1.50.0
protobuf_version := 3.21.9
google_common_protos_version := 2.10.0

# google/protobuf dependencies (predefined Protos for e.g. Timestamp, Duration, etc)
${common_protos}/protobuf-java.jar:
	curl "https://repo1.maven.org/maven2/com/google/protobuf/protobuf-java/${protobuf_version}/protobuf-java-${protobuf_version}.jar" --create-dirs -o "${common_protos}/protobuf-java.jar"

# google/api dependencies (Common Google Protos, such as field_behavior)
${common_protos}/proto-google-common-protos.jar:
	curl "https://repo1.maven.org/maven2/com/google/api/grpc/proto-google-common-protos/${google_common_protos_version}/proto-google-common-protos-${google_common_protos_version}.jar" --create-dirs -o "${common_protos}/proto-google-common-protos.jar"

${common_protos}: ${common_protos}/proto-google-common-protos.jar ${common_protos}/protobuf-java.jar ${common_protos}/validate/validate.proto

clean-common-protos:
	rm -rf ${common_protos}

${common_protos}/google/protobuf: ${common_protos}/protobuf-java.jar
	unzip -d ${common_protos} $< "google/**/*.proto"

${common_protos}/google/api: ${common_protos}/proto-google-common-protos.jar
	unzip -d ${common_protos} $< "google/**/*.proto"

${common_protos}/validate/validate.proto:
	curl "https://raw.githubusercontent.com/bufbuild/protoc-gen-validate/v0.9.1/validate/validate.proto" --create-dirs -o "${common_protos}/validate/validate.proto"

# To ensure that we use the same Google Common Protobuf files in all languages, we extract them from the jar
default-google-dependencies: ${common_protos}/google/protobuf ${common_protos}/google/api
protoc-gen-validate-dependency: ${common_protos}/validate/validate.proto

VERSION.env: Makefile
	GIT_BRANCH="$${CI_COMMIT_REF_NAME:-${git_branch}}" && \
	if [ -n "$$CI_COMMIT_TAG" ] || [ "$$GIT_BRANCH" = "master" ]; then echo "VERSION=${strmprivacy_api_version}" > $@; else echo "VERSION=${strmprivacy_api_version}-$${CI_COMMIT_SHORT_SHA:-${git_sha}}" > $@; fi

# =======================
# Miscellaneous
# =======================
intellij: ${common_protos}
	./scripts/setup-ide-protobuf-plugins.sh

buf-breaking:
	cd protos; buf breaking --against "../.git#branch=master,subdir=protos"

buf-lint: ${common_protos}/google/api ${common_protos}/google/protobuf
	cd protos; buf lint

api-lint:
	docker run --rm -v "$(pwd):/workspace" europe-west4-docker.pkg.dev/stream-machine-development/docker/build/google-api-linter:1.48.0 ./scripts/api-linter.sh

protodocs-clean:
	rm -rf protodocs

protodocs: protodocs-clean
	docker run --rm -v "$(pwd)/protodocs:/out" -v "$(pwd)/protos:/protos" -v "$(pwd)/lang:/lang" pseudomuto/protoc-gen-doc ${relative_proto_files} --proto_path=lang/.common-protos --doc_opt=markdown,docs.md

mock-ci-prepare: default-google-dependencies protoc-gen-validate-dependency
	rm -rf mock/lang/ mock/protos/strmprivacy && \
	mkdir -p mock/lang/ mock/protos/strmprivacy && \
	cp -r $$(find lang/.common-protos -type d -maxdepth 1) mock/lang/ && \
	cp -r protos/strmprivacy/api mock/protos/strmprivacy/api

mock-build: default-google-dependencies protoc-gen-validate-dependency
	docker build -t strm-gripmock --build-arg BUILD_DIR=mock -f mock/Dockerfile .

mock-start:
	docker run -p 4770:4770 -p 4771:4771 -v "$(pwd)/mock/sample-stub.json:/protos:/stubs/account.json" strm-gripmock

# =======================
# Build and publish tasks
# =======================
clean: jvm-clean python-clean go-clean typescript-clean
build: jvm-build python-build go-build typescript-build

# -----------------
# generate
# -----------------
lang/jvm/src lang/go/src lang/python/src: $@
	cd protos; buf generate

# See protos/buf.gen.typescript.yaml for the reason this is necessary
lang/typescript/src:
	cd protos; buf generate --template buf.gen.typescript.yaml --include-imports

generate: lang/jvm/src lang/go/src lang/python/src lang/typescript/src VERSION.env

# -----------------
# JVM
# -----------------
jvm-clean:
	make -C lang/jvm clean

jvm-build: lang/jvm/src
	make -C lang/jvm build

jvm-publish: lang/jvm/src
	make -C lang/jvm publish

jvm-publish-local: lang/jvm/src
	make -C lang/jvm publish-local

# -----------------
# Python
# -----------------
python-clean:
	make -C lang/python clean

python-build: lang/python/src VERSION.env
	make -C lang/python build

python-build-public: lang/python/src VERSION.env
	make -C lang/python build-public

python-publish-test: lang/python/src VERSION.env
	make -C lang/python publish-test

python-publish-release: lang/python/src VERSION.env
	make -C lang/python publish

python-publish-public-test: lang/python/src VERSION.env
	make -C lang/python publish-public-test

python-publish-public-release: lang/python/src VERSION.env
	make -C lang/python publish-public

# -----------------
# Golang
# -----------------
go-clean:
	make -C lang/go clean

go-build: lang/go/src VERSION.env
	make -C lang/go build

# -----------------
# TypeScript
# -----------------
typescript-clean:
	make -C lang/typescript clean

typescript-build: lang/typescript/src
	make -C lang/typescript build

typescript-publish-release: lang/typescript/src
	make -C lang/typescript publish

typescript-publish-snapshot: lang/typescript/src
	make -C lang/typescript publish-snapshot

json-schema:
	mkdir -p json-schema
	rm -rf json-schema/*
	protoc --jsonschema_out=json-schema \
		--proto_path=${protos_dir}:${common_protos} \
		--jsonschema_opt=enforce_oneof \
		--jsonschema_opt=disallow_additional_properties \
		${entities_protos}

