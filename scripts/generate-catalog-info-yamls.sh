#!/bin/bash

PROTOS_DIR="protos"
cd "$PROTOS_DIR" || exit

proto_files=$(find strmprivacy -name '*.proto')

CATALOG_INFO_ROOT_FILE="../catalog-info.yaml"
CATALOG_INFO_DIR="catalog-info"
CATALOG_INFO_DIR_RELATIVE="../$CATALOG_INFO_DIR"

mkdir -p "$CATALOG_INFO_DIR_RELATIVE"

cat << EOF > "$CATALOG_INFO_ROOT_FILE"
apiVersion: backstage.io/v1alpha1
kind: Location
metadata:
  name: api-definitions
  description: STRM Privacy api definitions
spec:
  targets:
  - ./$CATALOG_INFO_DIR/_api=definitions.yaml
EOF

for file in $proto_files; do
  # Check if the file actually has a service
  if grep -q "service " "$file"; then
    api_type=$(echo "$file" | awk -F'/' '{ print $2 }')
    api_section=$(echo "$file" | awk -F'/' '{ print $3 }')
    api_version=$(echo "$file" | awk -F'/' '{ print $4 }')
    proto_file_name=$(echo "$file" | awk -F'/' '{ print $NF }' | awk -F'.' '{ print $1 }')
    service_name=$(awk -F" " '$1=="service"{print $2;exit;}' "$file")

    destination_file="$api_type-$api_version-$api_section-$proto_file_name.yaml"

cat << EOF > "$CATALOG_INFO_DIR_RELATIVE/$destination_file"
apiVersion: backstage.io/v1alpha1
kind: API
metadata:
  name: $api_section-$proto_file_name
  namespace: core
  title: "$service_name $api_version"
  labels:
    api-type: "$api_type"
spec:
  type: grpc
  lifecycle: production
  owner: core-team
  definition: |
$(awk '{print "    " $0}' "$file")
EOF

    echo "  - ./$CATALOG_INFO_DIR/$destination_file" >> "$CATALOG_INFO_ROOT_FILE"

  fi
done
