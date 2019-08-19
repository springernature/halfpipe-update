#!/usr/bin/env bash

export PIPELINE_NAME="halfpipe-update-test"
export CONCOURSE_TEAM="engineering-enablement"
export CONCOURSE_USERNAME=$(vault read -field=username springernature/engineering-enablement/concourse)
export CONCOURSE_PASSWORD=$(vault read -field=password springernature/engineering-enablement/concourse)

(
  cd ../halfpipe-update-docker
  docker build -t hud .
)

docker run -it --rm \
  -v "${PWD}/..":/work \
  -w /work/halfpipe-update-test \
  -e PIPELINE_NAME \
  -e CONCOURSE_TEAM \
  -e CONCOURSE_USERNAME \
  -e CONCOURSE_PASSWORD \
  hud \
  bash
