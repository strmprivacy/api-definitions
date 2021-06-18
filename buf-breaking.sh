#!/bin/sh

# Unfortunately, when comparing with Git, Buf cannot resolve external proto's,
# since these are not part of the repository. As far as I can see, it's impossible to
# configure Git to use a local "protos root" directory when comparing with Git.
# To bypass this limitation, we compare with a locally generated image,
# which we generate here, based on the latest master revision.

# Checkout the latest master revision in a subdirectory.
git clone https://gitlab-ci-token:${CI_JOB_TOKEN}@gitlab.com/stream-machine/api-definitions.git prev-api-definitions

cd prev-api-definitions

# link to the google-api-linter directory, which is used as a "protos root".
# This symlink is the real reason for this whole workaround
ln -sf ../google-api-linter google-api-linter
buf build -o image.bin

cd ..

# Finally, compare the current API against the previous master API.
buf breaking --against prev-api-definitions/image.bin
