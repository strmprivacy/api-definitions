#!/usr/bin/env bash

REPO_ROOT_DIR="$( cd "$( dirname "$0" )/.." && pwd )"
IDEA_DIR="$REPO_ROOT_DIR/.idea"

# Settings for Official Jetbrains Protocol Buffers plugin
cat << EOF > "$IDEA_DIR/protoeditor.xml"
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
          <option name="location" value="jar://\$PROJECT_DIR$/lang/.common-protos/proto-google-common-protos.jar!/" />
        </ImportPathEntry>
        <ImportPathEntry>
          <option name="location" value="jar://\$PROJECT_DIR$/lang/.common-protos/protobuf-java.jar!/" />
        </ImportPathEntry>
      </list>
    </option>
    <option name="descriptorPath" value="google/protobuf/descriptor.proto" />
  </component>
</project>
EOF

# Settings for HIGAN IntelliJ Protobuf Plugin
cat << EOF > "$IDEA_DIR/protobuf.xml"
<?xml version="1.0" encoding="UTF-8"?>
<project version="4">
  <component name="ProtobufSettings">
    <option name="importRoots">
      <list>
        <ImportRootEntry>
          <option name="path" value="file://\$PROJECT_DIR$/protos" />
        </ImportRootEntry>
        <ImportRootEntry>
          <option name="path" value="jar://\$PROJECT_DIR$/lang/.common-protos/proto-google-common-protos.jar!/" />
        </ImportRootEntry>
        <ImportRootEntry>
          <option name="path" value="jar://\$PROJECT_DIR$/lang/.common-protos/protobuf-java.jar!/" />
        </ImportRootEntry>
      </list>
    </option>
  </component>
</project>
EOF

# Settings to mark protos directory as sources
IML_FILE=$(find "$IDEA_DIR" -name '*.iml')

if [ -f "$IML_FILE" ]; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    gsed -i 's|<content url="file://$MODULE_DIR$" />|<content url="file://$MODULE_DIR$"><sourceFolder url="file://$MODULE_DIR$/protos" isTestSource="false" /></content>|g' "$IML_FILE"
  else
    sed -i 's|<content url="file://$MODULE_DIR$" />|<content url="file://$MODULE_DIR$"><sourceFolder url="file://$MODULE_DIR$/protos" isTestSource="false" /></content>|g' "$IML_FILE"
  fi
else
cat <<-EOF > "$IML_FILE"
<?xml version="1.0" encoding="UTF-8"?>
<module type="JAVA_MODULE" version="4">
  <component name="Go" enabled="true" />
  <component name="NewModuleRootManager" inherit-compiler-output="true">
    <exclude-output />
    <content url="file://\$MODULE_DIR$">
      <sourceFolder url="file://\$MODULE_DIR$/protos" isTestSource="false" />
    </content>
    <orderEntry type="inheritedJdk" />
    <orderEntry type="sourceFolder" forTests="false" />
  </component>
  <component name="TemplatesService">
    <option name="TEMPLATE_FOLDERS">
      <list>
        <option value="\$MODULE_DIR$/node_modules/conventional-changelog-writer/templates" />
      </list>
    </option>
  </component>
</module>
EOF
fi


