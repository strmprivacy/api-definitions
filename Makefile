.PHONY: buf-breaking go clean mvn

proto_files := $(shell find protos -name *.proto)

buf-breaking:
	bash .buf-breaking.sh

clean:
	rm -rf build/go/*

go: clean
	protoc ${proto_files} --proto_path=protos --go_out=module=streammachine.io/api:build/go --go-grpc_out=module=streammachine.io/api:build/go && \
	cd build/go && \
	go mod init streammachine.io/api && \
	go mod tidy

