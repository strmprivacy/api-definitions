.PHONY: clean build generate setup

build_dir := build

clean:
	rm -rf ${build_dir} && \
	rm -f VERSION

VERSION: ../../Makefile ../../VERSION.env
	. ./../../VERSION.env && echo "$$VERSION" > $@

generate: VERSION
	mkdir -p ${build_dir} && \
	protoc ${public_proto_files} \
		--proto_path=${protos_dir} \
		--proto_path=${common_protos} \
		--go_out=module=github.com/strmprivacy/api-definitions-go:${build_dir} \
		--go-grpc_out=module=github.com/strmprivacy/api-definitions-go:${build_dir}

setup: VERSION
	cd ${build_dir} && \
	MAJOR_VERSION=$$(cat ../VERSION | cut -d"." -f1) && \
	go mod init github.com/strmprivacy/api-definitions-go/v$${MAJOR_VERSION} && \
	go get google.golang.org/grpc@v${grpc_version} && \
	go mod tidy

build: generate setup
