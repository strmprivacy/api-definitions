.PHONY: clean build generate setup

build_dir := build

clean:
	rm -rf ${build_dir} && \
	rm -f VERSION

VERSION: ../../Makefile ../../VERSION.env
	. ./../../VERSION.env && echo "$$VERSION" > $@

generate: VERSION
	mkdir ${build_dir} && \
	protoc ${public_proto_files} \
		--proto_path=${protos_dir} \
		--proto_path=${common_protos} \
		--go_out=module=streammachineio/api-definitions-go:${build_dir} \
		--go-grpc_out=module=streammachineio/api-definitions-go:${build_dir}

setup:
	cd ${build_dir} && \
	go mod init github.com/streammachineio/api-definitions-go && \
	go get google.golang.org/grpc@v${grpc_version} && \
	go mod tidy

build: generate setup
