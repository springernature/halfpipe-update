#!/usr/bin/env bash
export PIPELINE_NAME=halfpipe-update-test
export CONCOURSE_URL=$(vault read -field=url springernature/engineering-enablement/concourse)
export CONCOURSE_PASSWORD=$(vault read -field=password springernature/engineering-enablement/concourse)
export CONCOURSE_TEAM=$(vault read -field=team springernature/engineering-enablement/concourse)
export CONCOURSE_USERNAME=$(vault read -field=username springernature/engineering-enablement/concourse)
export SYNC_FLY_AND_HALFPIPE="false"

../halfpipe-update-docker/update-pipeline-v2
