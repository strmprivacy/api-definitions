.PHONY: intellij clean build publish

# =======================
# Variables
# =======================
pwd := $(shell pwd)
protos_dir := ${CURDIR}/protos
proto_files := $(shell find "${pwd}/protos" -name *.proto)
proto_files_python := $(shell find "${pwd}/protos" -name *.proto)
common_protos := ${CURDIR}/lang/.common-protos

export

# =======================
# Versions and dependencies
# =======================
streammachine_api_version := 1.10.0

grpc_version := 1.38.1
protobuf_version := 3.17.3
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

# =======================
# Miscellaneous
# =======================
intellij: ${common_protos}/protobuf-java.jar ${common_protos}/proto-google-common-protos.jar
	./scripts/setup-ide-protobuf-plugins.sh

buf-breaking:
	bash buf-breaking.sh

api-lint:
	docker run --rm -v "${pwd}:/workspace" eu.gcr.io/stream-machine-development/google/api-linter:1.25.0 ./api-linter.sh

# =======================
# Build and publish tasks
# =======================
clean: clean-jvm clean-python clean-go
build: build-jvm build-python build-go
publish: publish-jvm publish-python

# -----------------
# JVM
# -----------------
clean-jvm:
	make -C lang/jvm clean

build-jvm:
	make -C lang/jvm build

publish-jvm:
	make -C lang/jvm publish

# -----------------
# Python
# -----------------
clean-python:
	make -C lang/python clean

build-python: ${common_protos}/google
	make -C lang/python build

publish-python: ${common_protos}/google
	make -C lang/python publish

# -----------------
# Golang
# -----------------
build-go: ${common_protos}/google
	make -C lang/go build

clean-go:
	make -C lang/go clean

