#!/bin/bash

proto_files=$(find protos/io/streammachine/api -name '*.proto')

echo $proto_files

#/Users/rtrietsch/Downloads/api-linter --config api-linter.yaml -I protos $proto_files

for file in $proto_files; do
  echo "------------------------------------------"
  echo "$file"
  echo "------------------------------------------"
  /Users/rtrietsch/Downloads/api-linter --config api-linter.yaml -I protos "$file"
  echo
  echo
done
