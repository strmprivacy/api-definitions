#!/usr/bin/env bash

HOST_DIR=$(dirname $(dirname $(readlink -f $0)))
PROTOS_DIR="/workspace/protos"

docker run -p 4770:4770 \
 -p 4771:4771 \
 -v "$HOST_DIR/lang/.common-protos/google:$PROTOS_DIR/google" \
 -v "$HOST_DIR/lang/.common-protos/validate:$PROTOS_DIR/validate" \
 -v "$HOST_DIR/protos/strmprivacy:$PROTOS_DIR/strmprivacy" \
 -v "$HOST_DIR/scripts/stub.json:$PROTOS_DIR/stubs/stub.json" \
 --workdir "$PROTOS_DIR" \
 --entrypoint "/bin/sh" \
 tkpd/gripmock \
 -c "go get github.com/envoyproxy/protoc-gen-validate/validate; gripmock --stub=stubs --imports=. strmprivacy/api/account/v1/account_v1.proto"
