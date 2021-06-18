#!/bin/bash

proto_files=$(find protos/io/streammachine/api -name '*.proto')

declare -i EXIT_STATUS_CODE=0

for file in $proto_files; do
  echo "------------------------------------------"
  echo "$file"
  echo "------------------------------------------"
  api-linter \
    --set-exit-status \
    --config api-linter.yaml \
    -I /included-protos/ \
    -I protos \
    "$file"
  EXIT_STATUS_CODE+=$?
  echo
done

echo $EXIT_STATUS_CODE
exit $EXIT_STATUS_CODE
