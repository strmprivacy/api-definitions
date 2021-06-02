SHELL := bash
.PHONY: go clean

proto_files := $(shell find . -name *.proto )

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

go:
	protoc ${proto_files} --go_out=plugins=grpc,module=streammachine.io/api:build && \
	cd ${mkfile_dir}/build && \
	go mod init streammachine.io/api && \
	go mod tidy

clean:
	rm -rf build/*




# vim:noexpandtab

