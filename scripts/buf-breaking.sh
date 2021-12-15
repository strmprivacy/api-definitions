#!/bin/sh

set -x

# Unfortunately, when comparing with Git, Buf cannot resolve external proto's,
# since these are not part of the repository. As far as I can see, it's impossible to
# configure Git to use a local "protos root" directory when comparing with Git.
# To bypass this limitation, we compare with a locally generated image,
# which we generate here, based on the latest master revision.

if [ -z "$CI_PROJECT_NAME" ]; then
  CLONE_URL="https://gitlab-ci-token:${CI_JOB_TOKEN}@gitlab.com/strmprivacy/api-definitions.git"
  BUF_IMAGE_LOCATION="image.bin"
  ENSURE_COMMON_PROTOS_COMMAND="ln -sf ../google-api-linter google-api-linter"
else
  CLONE_URL="git@gitlab.com:strmprivacy/api-definitions.git"
  BUF_IMAGE_LOCATION="prev-api-definitions/image.bin"
  ENSURE_COMMON_PROTOS_COMMAND="cp -r ../lang/.common-protos lang/.common-protos"
fi

env

# Checkout the latest master revision in a subdirectory.
git clone "$CLONE_URL" prev-api-definitions

cd prev-api-definitions

# link to the google-api-linter directory, which is used as a "protos root".
# This symlink is the real reason for this whole workaround
eval "$ENSURE_COMMON_PROTOS_COMMAND"
buf build -o image.bin

cd ..

# Finally, compare the current API against the previous master API.
buf breaking --against "$BUF_IMAGE_LOCATION"
exit_code=$?

# Clean up generated files afterwards
rm -rf google-api-linter
rm -rf prev-api-definitions

exit $exit_code
