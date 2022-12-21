#!/usr/bin/env bash

PROTOS_DIR="protos"
cd "$PROTOS_DIR" || exit

proto_files=$(find strmprivacy -name '*.proto')

declare -i EXIT_SUM=0

for file in $proto_files; do
  api-linter \
    --set-exit-status \
    --config ../.api-linter.yaml \
    -I /included-protos/ \
    -I . \
    "$file"
  EXIT_SUM+=$?
done

EXIT_CODE=$(( EXIT_SUM>=1 ? 1 : 0))

echo "API Linting done. Exit code: $EXIT_CODE"
exit $EXIT_CODE
