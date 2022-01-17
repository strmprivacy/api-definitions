#!/bin/bash

REPO_ROOT_DIR="$( cd "$( dirname "$0" )/.." && pwd )"

proto_files=$(find protos -name '*.proto')

CATALOG_INFO_DIR="$REPO_ROOT_DIR/catalog-info"
CATALOG_INFO_LOCATION_FILE="$REPO_ROOT_DIR/catalog-info.yaml"
CATALOG_INFO_COMPONENT_FILE="$CATALOG_INFO_DIR/_api-definitions.yaml"

COMPONENT_NAMESPACE="core"

mkdir -p "$CATALOG_INFO_DIR"

cat << EOF > "$CATALOG_INFO_LOCATION_FILE"
apiVersion: backstage.io/v1alpha1
kind: Location
metadata:
  name: api-definitions
  description: STRM Privacy api definitions
spec:
  targets:
  - ./$(realpath --relative-to="$REPO_ROOT_DIR" "$CATALOG_INFO_COMPONENT_FILE")
EOF

languages=$(ls "$REPO_ROOT_DIR/lang" | awk '{print "  - " $0}')

cat << EOF > "$CATALOG_INFO_COMPONENT_FILE"
apiVersion: backstage.io/v1alpha1
kind: Component
metadata:
  name: api-definitions
  namespace: $COMPONENT_NAMESPACE
  description: Single source that contains all APIs, which are generated to various languages
  annotations:
    backstage.io/techdocs-ref: dir:.
  tags:
$languages
spec:
  type: app
  lifecycle: production
  owner: core-team
  providesApis:
EOF

for file in $proto_files; do
  # Check if the file actually has a service
  if grep -q "service " "$file"; then
    api_type=$(echo "$file" | awk -F'/' '{ print $3 }')
    api_component=$(echo "$file" | awk -F'/' '{ print $4 }')
    api_version=$(echo "$file" | awk -F'/' '{ print $5 }')
    proto_file_name=$(echo "$file" | awk -F'/' '{ print $NF }' | awk -F'.' '{ print $1 }')
    service_name=$(awk -F" " '$1=="service"{print $2;exit;}' "$file")

    api_name="$api_component-$api_type-$proto_file_name"
    destination_file="$CATALOG_INFO_DIR/$api_type-$api_version-$api_component-$proto_file_name.yaml"

cat << EOF > "$CATALOG_INFO_DIR_RELATIVE/$destination_file"
apiVersion: backstage.io/v1alpha1
kind: API
metadata:
  name: $api_name
  namespace: $COMPONENT_NAMESPACE
  title: "$service_name $api_version"
  labels:
    api-type: "$api_type"
    api-version: "$api_version"
    api-component: "$api_component"
spec:
  type: grpc
  lifecycle: production
  owner: core-team
  definition: |
$(awk '{print "    " $0}' "$file")
EOF

    # Write API Component to Backstage YAML
    echo "  - ./$(realpath --relative-to="$REPO_ROOT_DIR" "$destination_file")" >> "$CATALOG_INFO_LOCATION_FILE"

    # Append to provided apis in the API Definitions component Backstage YAML
    echo "  - $COMPONENT_NAMESPACE/$api_name" >> "$CATALOG_INFO_COMPONENT_FILE"
  fi
done
