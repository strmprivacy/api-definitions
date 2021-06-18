#!/usr/bin/env bash

PROTOS_DIR="protos"
GOOGLE_PROTOBUF_DEPS_VERSION="3.17.3"
GOOGLE_COMMON_PROTOS_VERSION="2.3.2"

# google/protobuf dependencies
wget "https://repo1.maven.org/maven2/com/google/protobuf/protobuf-java/$GOOGLE_PROTOBUF_DEPS_VERSION/protobuf-java-$GOOGLE_PROTOBUF_DEPS_VERSION.jar" -O "$PROTOS_DIR/protobuf-java.jar"

# google/api dependencies
wget "https://repo1.maven.org/maven2/com/google/api/grpc/proto-google-common-protos/$GOOGLE_COMMON_PROTOS_VERSION/proto-google-common-protos-$GOOGLE_COMMON_PROTOS_VERSION.jar"  -O "$PROTOS_DIR/proto-google-common-protos.jar"

# Settings for Official Jetbrains Protocol Buffers plugin
cat << EOF > ".idea/protoeditor.xml"
<?xml version="1.0" encoding="UTF-8"?>
<project version="4">
  <component name="ProtobufLanguageSettings">
    <option name="autoConfigEnabled" value="false" />
    <option name="importPathEntries">
      <list>
        <ImportPathEntry>
          <option name="location" value="file://\$PROJECT_DIR$/protos" />
        </ImportPathEntry>
        <ImportPathEntry>
          <option name="path" value="jar://\$PROJECT_DIR$/protos/proto-google-common-protos.jar!/" />
        </ImportPathEntry>
        <ImportPathEntry>
          <option name="path" value="jar://\$PROJECT_DIR$/protos/protobuf-java.jar!/" />
        </ImportPathEntry>
      </list>
    </option>
    <option name="descriptorPath" value="google/protobuf/descriptor.proto" />
  </component>
</project>
EOF

# Settings for HIGAN IntelliJ Protobuf Plugin
cat << EOF > ".idea/protobuf.xml"
<?xml version="1.0" encoding="UTF-8"?>
<project version="4">
  <component name="ProtobufSettings">
    <option name="importRoots">
      <list>
        <ImportRootEntry>
          <option name="path" value="file://\$PROJECT_DIR$/protos" />
        </ImportRootEntry>
        <ImportRootEntry>
          <option name="path" value="jar://\$PROJECT_DIR$/protos/proto-google-common-protos.jar!/" />
        </ImportRootEntry>
        <ImportRootEntry>
          <option name="path" value="jar://\$PROJECT_DIR$/protos/protobuf-java.jar!/" />
        </ImportRootEntry>
      </list>
    </option>
  </component>
</project>
EOF
