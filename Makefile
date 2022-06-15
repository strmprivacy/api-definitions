.PHONY: intellij clean build publish buf-breaking buf-lint api-lint default-protobuf-dependencies protodocs protodocs-clean clean-common-protos

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

export

# =======================
# Versions and dependencies
# =======================
strmprivacy_api_version := 2.41.0

grpc_version := 1.46.0
protobuf_version := 3.20.1
google_common_protos_version := 2.8.3

# google/protobuf dependencies (predefined Protos for e.g. Timestamp, Duration, etc)
${common_protos}/protobuf-java.jar:
	curl "https://repo1.maven.org/maven2/com/google/protobuf/protobuf-java/${protobuf_version}/protobuf-java-${protobuf_version}.jar" --create-dirs -o "${common_protos}/protobuf-java.jar"

# google/api dependencies (Common Google Protos, such as field_behavior)
${common_protos}/proto-google-common-protos.jar:
	curl "https://repo1.maven.org/maven2/com/google/api/grpc/proto-google-common-protos/${google_common_protos_version}/proto-google-common-protos-${google_common_protos_version}.jar" --create-dirs -o "${common_protos}/proto-google-common-protos.jar"

${common_protos}: ${common_protos}/proto-google-common-protos.jar ${common_protos}/protobuf-java.jar

clean-common-protos:
	rm -rf ${common_protos}

${common_protos}/google/protobuf: ${common_protos}/protobuf-java.jar
	unzip -d ${common_protos} $< "google/**/*.proto"

${common_protos}/google/api: ${common_protos}/proto-google-common-protos.jar
	unzip -d ${common_protos} $< "google/**/*.proto"

# To ensure that we use the same Google Common Protobuf files in all languages, we extract them from the jar
default-google-dependencies: ${common_protos}/google/protobuf ${common_protos}/google/api

VERSION.env: Makefile
	GIT_BRANCH="$${CI_COMMIT_REF_NAME:-${git_branch}}" && \
	if [ -n "$$CI_COMMIT_TAG" ] || [ "$$GIT_BRANCH" = "master" ]; then echo "VERSION=${strmprivacy_api_version}" > $@; else echo "VERSION=${strmprivacy_api_version}-$${CI_COMMIT_SHORT_SHA:-${git_sha}}" > $@; fi

# =======================
# Miscellaneous
# =======================
intellij: ${common_protos}/protobuf-java.jar ${common_protos}/proto-google-common-protos.jar
	./scripts/setup-ide-protobuf-plugins.sh

buf-breaking:
	bash ./scripts/buf-breaking.sh

buf-lint: ${common_protos}/google/api ${common_protos}/google/protobuf
	buf lint

api-lint:
	docker run --rm -v "${pwd}:/workspace" europe-west4-docker.pkg.dev/stream-machine-development/docker/build/google-api-linter:1.29.3 ./scripts/api-linter.sh

protodocs-clean:
	rm -rf protodocs

protodocs: protodocs-clean
	docker run --rm -v "$(pwd)/protodocs:/out" -v "$(pwd)/protos:/protos" -v "$(pwd)/lang:/lang" pseudomuto/protoc-gen-doc ${relative_proto_files} --proto_path=lang/.common-protos --doc_opt=html,index.html

# =======================
# Build and publish tasks
# =======================
clean: clean-common-protos jvm-clean python-clean go-clean typescript-clean
build: default-google-dependencies jvm-build python-build go-build typescript-build

# -----------------
# JVM
# -----------------
jvm-clean:
	make -C lang/jvm clean

jvm-build:
	make -C lang/jvm build

jvm-publish:
	make -C lang/jvm publish

jvm-publish-local:
	make -C lang/jvm publish-local

# -----------------
# Python
# -----------------
python-clean:
	make -C lang/python clean

python-build: ${common_protos}/google/api ${common_protos}/google/protobuf VERSION.env
	make -C lang/python generate build

python-build-public: ${common_protos}/google/api ${common_protos}/google/protobuf VERSION.env
	make -C lang/python generate-public build

python-publish-test: ${common_protos}/google/api ${common_protos}/google/protobuf VERSION.env
	make -C lang/python publish-test

python-publish-release: ${common_protos}/google/api ${common_protos}/google/protobuf VERSION.env
	make -C lang/python publish

python-publish-public-test: ${common_protos}/google/api ${common_protos}/google/protobuf VERSION.env
	make -C lang/python publish-public-test

python-publish-public-release: ${common_protos}/google/api ${common_protos}/google/protobuf VERSION.env
	make -C lang/python publish-public

# -----------------
# Golang
# -----------------
go-generate: ${common_protos}/google/api ${common_protos}/google/protobuf VERSION.env
	make -C lang/go generate

go-setup: VERSION.env
	make -C lang/go setup

go-build: ${common_protos}/google/api ${common_protos}/google/protobuf VERSION.env
	make -C lang/go build

go-clean:
	make -C lang/go clean

# -----------------
# TypeScript
# -----------------
typescript-clean:
	make -C lang/typescript clean

typescript-generate: ${common_protos}/google/api ${common_protos}/google/protobuf
	make -C lang/typescript generate

lang/typescript/build/.timestamp: typescript-generate
	touch lang/typescript/build/.timestamp

typescript-build: lang/typescript/build/.timestamp
	make -C lang/typescript build

typescript-build-without-generate:
	make -C lang/typescript build

typescript-publish-release:
	make -C lang/typescript publish

typescript-publish-snapshot:
	make -C lang/typescript publish-snapshot
