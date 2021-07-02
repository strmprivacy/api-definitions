.PHONY: buf-breaking go clean mvn publish

proto_files := $(shell find protos -name *.proto)
google_proto := .google-common-protos/.touch
pwd := $(shell pwd)

buf-breaking:
	bash buf-breaking.sh

install:
	pip install grpcio-tools

api-lint:
	docker run --rm -v "${pwd}:/workspace" eu.gcr.io/stream-machine-development/google/api-linter:1.25.0 ./api-linter.sh

clean:
	rm -rf build/go/* ${google_proto}

.idea/proto-google-common-protos.jar:
	./setup-ide-protobuf-plugins.sh

${google_proto}: .idea/proto-google-common-protos.jar
	unzip -d .google-common-protos $< "google/**/*.proto" && \
	touch $@

build-jvm:
	make -C lang/jvm build

publish-jvm:
	make -C lang/jvm publish


publish: publish-jvm publish-python


python: clean ${google_proto}
	python -m grpc_tools.protoc ${proto_files} --proto_path=protos \
		--proto_path=.google-common-protos\
		--python_out=build/python --grpc_python_out=build/python

go: clean ${google_proto}
	protoc ${proto_files} --proto_path=protos \
		--proto_path=.google-common-protos\
		--go_out=module=streammachine.io/api:build/go --go-grpc_out=module=streammachine.io/api:build/go && \
	cd build/go && \
	go mod init streammachine.io/api && \
	go mod tidy

