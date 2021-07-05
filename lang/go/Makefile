.PHONY: clean build generate setup

build_dir := build

VERSION: ../../Makefile
	GIT_BRANCH="$${CI_COMMIT_REF_NAME:-${git_branch}}" && \
	if [ -n "$$CI_COMMIT_TAG" ] || [ "$$GIT_BRANCH" = "master" ]; then echo ${streammachine_api_version} > $@; else echo "${streammachine_api_version}-${git_sha}" > $@; fi

clean:
	rm -rf ${build_dir} && \
	rm -f VERSION

generate: VERSION
	mkdir ${build_dir} && \
	protoc ${proto_files} \
		--proto_path=${protos_dir} \
		--proto_path=${common_protos} \
		--go_out=module=streammachine.io/api:${build_dir} \
		--go-grpc_out=module=streammachine.io/api:${build_dir}

setup:
	cd ${build_dir} && \
	go mod init streammachine.io/api && \
	go get google.golang.org/grpc@v${grpc_version} && \
	go mod tidy

build: generate setup
