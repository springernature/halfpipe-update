#!/usr/bin/env bash

export PIPELINE_NAME="halfpipe-update-test"
export CONCOURSE_TEAM="engineering-enablement"
export CONCOURSE_USERNAME=$(vault kv get -field=username springernature/engineering-enablement/concourse)
export CONCOURSE_PASSWORD=$(vault kv get -field=password springernature/engineering-enablement/concourse)
export HALFPIPE_SEMVER_SA="$(vault kv get -field=private_key springernature/shared/halfpipe-semver)"

# (
#   cd ../halfpipe-update-docker
#   docker buildx build -t eu.gcr.io/halfpipe-io/engineering-enablement/halfpipe-update-test --push
# )

docker run -it --rm \
  -v "${PWD}/..":/tmp/job/git \
  -w /tmp/job/git/halfpipe-update-test \
  -e PIPELINE_NAME \
  -e CONCOURSE_TEAM \
  -e CONCOURSE_USERNAME \
  -e CONCOURSE_PASSWORD \
  -e HALFPIPE_SEMVER_SA \
  eu.gcr.io/halfpipe-io/engineering-enablement/halfpipe-update-test \
  ../halfpipe-update-docker/update-pipeline
