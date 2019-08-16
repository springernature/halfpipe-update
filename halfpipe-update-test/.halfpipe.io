team: engineering-enablement
pipeline: halfpipe-update-test

feature_toggles:
- update-pipeline

tasks:
- type: run
  name: task 1
  script: \date
  docker:
    image: alpine
