#!/bin/bash
set -ex

path=$1
cd $1
shift

protoc $* --go_out=plugins=grpc,paths=source_relative:build
cd $path/build/io/streammachine/external_api
go mod init streammachine.io/external_api

cd $path/build/io/streammachine/internal_api
go mod init streammachine.io/internal_api
go mod edit -replace streammachine.io/external_api=../external_api

cd $path/build
go mod init streammachine.io/api
go mod edit -replace streammachine.io/external_api=./io/streammachine/external_api
go mod edit -replace streammachine.io/internal_api=./io/streammachine/internal_api
go mod tidy
