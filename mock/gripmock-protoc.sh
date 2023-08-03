#!/usr/bin/env sh

mkdir $GRIPMOCK_GENERATION_DIR

protoc -I "$PROTOS_DIR" --go_out=/go/src --go-grpc_out=require_unimplemented_servers=false:/go/src --gripmock_out=admin-port=4771,grpc-address=0.0.0.0,grpc-port=4770:$GRIPMOCK_GENERATION_DIR $(find "$PROTOS_DIR/strmprivacy" -name *.proto)

go get github.com/envoyproxy/protoc-gen-validate/validate
go get github.com/strmprivacy/api-definitions-go/v3
