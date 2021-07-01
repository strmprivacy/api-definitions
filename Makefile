.PHONY: buf-breaking go clean mvn

proto_files := $(shell find protos -name *.proto)
google_proto := .google-common-protos/.touch
pwd := $(shell pwd)

buf-breaking:
	bash buf-breaking.sh

api-lint:
	docker run --rm -v "${pwd}:/workspace" eu.gcr.io/stream-machine-development/google/api-linter:1.25.0 ./api-linter.sh

clean:
	rm -rf build/go/*

.idea/proto-google-common-protos.jar:
	./setup-ide-protobuf-plugins.sh

${google_proto}: .idea/proto-google-common-protos.jar
	unzip -d .google-common-protos $< "google/**/*.proto" && \
	touch $@

go: clean ${google_proto}
	protoc ${proto_files} --proto_path=protos \
		--proto_path=.google-common-protos\
		--go_out=module=streammachine.io/api:build/go --go-grpc_out=module=streammachine.io/api:build/go && \
	cd build/go && \
	go mod init streammachine.io/api && \
	go mod tidy

