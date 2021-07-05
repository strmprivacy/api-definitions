.PHONY: clean build

build_dir := build

clean:
	rm -rf ${build_dir}

build:
	mkdir ${build_dir} && \
	protoc ${proto_files} \
		--proto_path=${protos_dir} \
		--proto_path=${common_protos} \
		--go_out=module=streammachine.io/api:${build_dir} \
		--go-grpc_out=module=streammachine.io/api:${build_dir} && \
	cd ${build_dir} && \
	go mod init streammachine.io/api && \
	go get google.golang.org/grpc@v${grpc_version} && \
	go mod tidy
