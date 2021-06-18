#!/bin/bash

proto_files=$(find protos -name '*.proto')

declare -i EXIT_STATUS_CODE=0

for file in $proto_files; do
  api-linter \
    --set-exit-status \
    --config .api-linter.yaml \
    -I /included-protos/ \
    -I protos \
    "$file"
  EXIT_STATUS_CODE+=$?
done

echo "API Linting done. Exit code: $EXIT_STATUS_CODE"
exit $EXIT_STATUS_CODE
