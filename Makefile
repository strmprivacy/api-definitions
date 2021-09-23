.PHONY: intellij clean build publish buf-breaking buf-lint api-lint default-protobuf-dependencies docs clean-docs

# =======================
# Variables
# =======================
pwd := $(shell pwd)
protos_dir := ${CURDIR}/protos
proto_files := $(shell find "${pwd}/protos/streammachine" -name *.proto)
public_proto_files := $(shell find "${pwd}/protos/streammachine/api" -name *.proto)
relative_proto_files := $(shell find "protos/streammachine" -name *.proto)
common_protos := ${CURDIR}/lang/.common-protos
common_proto_files := $(shell find "${common_protos}" -name *.proto)
git_sha := $(shell git rev-parse --short HEAD)
git_branch := $(shell git rev-parse --abbrev-ref HEAD)

export

# =======================
# Versions and dependencies
# =======================
streammachine_api_version := 1.22.0

grpc_version := 1.38.1
protobuf_version := 3.17.3# make sure to update schema-tools as well
google_common_protos_version := 2.3.2

# google/protobuf dependencies (predefined Protos for e.g. Timestamp, Duration, etc)
${common_protos}/protobuf-java.jar:
	curl "https://repo1.maven.org/maven2/com/google/protobuf/protobuf-java/${protobuf_version}/protobuf-java-${protobuf_version}.jar" --create-dirs -o "${common_protos}/protobuf-java.jar"

# google/api dependencies (Common Google Protos, such as field_behavior)
${common_protos}/proto-google-common-protos.jar:
	curl "https://repo1.maven.org/maven2/com/google/api/grpc/proto-google-common-protos/${google_common_protos_version}/proto-google-common-protos-${google_common_protos_version}.jar" --create-dirs -o "${common_protos}/proto-google-common-protos.jar"

# To ensure that we use the same Google Common Protobuf files in all languages, we extract them from the jar
${common_protos}/google: ${common_protos}/proto-google-common-protos.jar
	unzip -d ${common_protos} $< "google/**/*.proto" && \
	touch $@

default-protobuf-dependencies: ${common_protos}/protobuf-java.jar
	unzip -d ${common_protos} $< "google/**/*.proto"

VERSION.env: Makefile
	GIT_BRANCH="$${CI_COMMIT_REF_NAME:-${git_branch}}" && \
	if [ -n "$$CI_COMMIT_TAG" ] || [ "$$GIT_BRANCH" = "master" ]; then echo "VERSION=${streammachine_api_version}" > $@; else echo "VERSION=${streammachine_api_version}-$${CI_COMMIT_SHORT_SHA:-${git_sha}}" > $@; fi

# =======================
# Miscellaneous
# =======================
intellij: ${common_protos}/protobuf-java.jar ${common_protos}/proto-google-common-protos.jar
	./scripts/setup-ide-protobuf-plugins.sh

buf-breaking:
	bash ./scripts/buf-breaking.sh

buf-lint: ${common_protos}/google
	buf lint

api-lint:
	docker run --rm -v "${pwd}:/workspace" eu.gcr.io/stream-machine-development/google/api-linter:1.25.0 ./scripts/api-linter.sh

clean-docs:
	rm -rf docs

docs: clean-docs
	docker run --rm -v "$(pwd)/docs:/out" -v "$(pwd)/protos:/protos" -v "$(pwd)/lang:/lang" pseudomuto/protoc-gen-doc ${relative_proto_files} --proto_path=lang/.common-protos --doc_opt=html,index.html

# =======================
# Build and publish tasks
# =======================
clean: clean-jvm clean-python clean-go
build: build-jvm build-python build-go

# -----------------
# JVM
# -----------------
clean-jvm:
	make -C lang/jvm clean

build-jvm:
	make -C lang/jvm build

publish-jvm:
	make -C lang/jvm publish

publish-local-jvm:
	make -C lang/jvm publish-local

# -----------------
# Python
# -----------------
clean-python:
	make -C lang/python clean

build-python: ${common_protos}/google VERSION.env
	make -C lang/python generate build

build-public-python: ${common_protos}/google VERSION.env
	make -C lang/python generate-public build

publish-python-test: ${common_protos}/google VERSION.env
	make -C lang/python publish-test

publish-python-release: ${common_protos}/google VERSION.env
	make -C lang/python publish

publish-public-python-test: ${common_protos}/google VERSION.env
	make -C lang/python publish-public-test

publish-public-python-release: ${common_protos}/google VERSION.env
	make -C lang/python publish-public

# -----------------
# Golang
# -----------------
generate-go: ${common_protos}/google VERSION.env
	make -C lang/go generate

setup-go:
	make -C lang/go setup

build-go: ${common_protos}/google VERSION.env
	make -C lang/go build

clean-go:
	make -C lang/go clean

# -----------------
# TypeScript
# -----------------
clean-typescript:
	make -C lang/typescript clean

build-typescript:
	make -C lang/typescript build

publish-typescript:
	make -C lang/typescript publish

publish-local-typescript:
	make -C lang/typescript publish-local
