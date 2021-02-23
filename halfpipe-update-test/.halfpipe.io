team: engineering-enablement
pipeline: halfpipe-update-test

triggers:
- type: git
  watched_paths:
  - halfpipe-update-test

tasks:
- type: run
  name: local-update-script
  script: ./local-update-pipeline.sh
  docker:
    image: eu.gcr.io/halfpipe-io/halfpipe-auto-update
  vars:
    CONCOURSE_URL: ((concourse.url))
    CONCOURSE_PASSWORD: ((concourse.password))
    CONCOURSE_TEAM: ((concourse.team))
    CONCOURSE_USERNAME: ((concourse.username))
    PIPELINE_NAME: halfpipe-update-test

- type: run
  name: run1
  script: \env
  docker:
    image: alpine

- type: run
  name: run10
  script: \env
  docker:
    image: alpine
  vars:
    FOO: foo2
