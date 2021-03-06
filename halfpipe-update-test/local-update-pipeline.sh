#!/usr/bin/env bash
set -euo pipefail

echo running $0

red='\033[0;31m'
green='\033[0;32m'
reset='\033[0m'

echored() {
  echo -e "${red}$@${reset}"
}

echogreen() {
  echo -e "${green}$@${reset}"
}

CONCOURSE_URL="${CONCOURSE_URL:-https://concourse.halfpipe.io}"
PIPELINE_CONFIG="/tmp/pipeline.yml"
SET_PIPELINE_OUTPUT="/tmp/set-pipeline-output"

echo
echogreen "* Halfpipe manifest:"
cat .halfpipe.io*


echo
echogreen "* STEP 1/8: Updating fly to latest version"
cat >/root/.flyrc << EOF
  targets:
    ci:
      api: ${CONCOURSE_URL}
EOF
fly -t ci sync


echo
echogreen "* STEP 2/8: Updating halfpipe to latest version"
halfpipe sync
echo
halfpipe version
echo


echo
echogreen "* STEP 3/8: Logging into concourse"
fly -t ${CONCOURSE_TEAM} login -c ${CONCOURSE_URL} -n ${CONCOURSE_TEAM} -u ${CONCOURSE_USERNAME} -p ${CONCOURSE_PASSWORD}


echo
echogreen "* STEP 4/8: Checking pipeline name"
_halfpipe_pipeline_name=$(yq e '.pipeline' .halfpipe.io*)
if [[ "$_halfpipe_pipeline_name" != "${PIPELINE_NAME}" ]]; then
  echored "Error: Pipeline name has changed (existing:${PIPELINE_NAME} new:$_halfpipe_pipeline_name)"
  echored "Pipelines must first be renamed with fly:"
  echored "  fly -t ${CONCOURSE_TEAM} rename-pipeline -o ${PIPELINE_NAME} -n $_halfpipe_pipeline_name"
  exit 1
fi

echo
echogreen "* STEP 5/8: Running halfpipe to generate Concourse pipeline"
halfpipe > ${PIPELINE_CONFIG}

echo "hack update job to use local script"
sed -i 's/path: update-pipeline/path: .\/local-update-pipeline.sh/' ${PIPELINE_CONFIG}


echo
echogreen "* STEP 6/8: Checking if pipeline has changed"
echo | fly -t ${CONCOURSE_TEAM} set-pipeline -p ${PIPELINE_NAME} -c ${PIPELINE_CONFIG} > ${SET_PIPELINE_OUTPUT}
if grep 'no changes to apply' ${SET_PIPELINE_OUTPUT}; then
  echo
  echogreen "Finished!"
  exit 0
else
  echo "found changes to apply"
fi


echo
echogreen "* STEP 7/8: Disabling old versions if new jobs added"

if grep -Eo 'job.+has been added' ${SET_PIPELINE_OUTPUT}; then

  echored 'disabling versions disabled'
#   if fly disable-resource-version --help > /dev/null 2>&1; then
#     ENABLED_VERSIONS=$(fly -t ${CONCOURSE_TEAM} resource-versions -r ${PIPELINE_NAME}/version --json --count=9999999 | jq -r "map(select(.enabled)) | .[].version.number")
#     for VER in $ENABLED_VERSIONS;
#       fly -t ${CONCOURSE_TEAM} disable-resource-version -r ${PIPELINE_NAME}/version -v number:${VER}
#     done
#   else
#     VERSIONS_ENDPOINT="/api/v1/teams/${CONCOURSE_TEAM}/pipelines/${PIPELINE_NAME}/resources/version/versions"
#     VERSION_IDS=$(fly -t ${CONCOURSE_TEAM} resource-versions -r ${PIPELINE_NAME}/version --json --count=9999999 | jq -r "map(select(.enabled)) | .[].id")
#     for ID in $VERSION_IDS; do
#       echo "disabling version id = ${ID}"
#       fly -t ${CONCOURSE_TEAM} curl ${VERSIONS_ENDPOINT}/${ID}/disable "" -- -X PUT -sS
#     done
#   fi

else
  echo "no jobs added"
fi


echo
echogreen "* STEP 8/8: Updating pipeline"
fly -t ${CONCOURSE_TEAM} set-pipeline -p ${PIPELINE_NAME} -c ${PIPELINE_CONFIG} --check-creds --non-interactive

echo
echo
echogreen "Finished!"
