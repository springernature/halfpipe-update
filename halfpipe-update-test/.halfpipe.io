team: engineering-enablement
pipeline: halfpipe-update-test

feature_toggles:
- update-pipeline

repo:
  watched_paths:
  - halfpipe-update-test

tasks:
- type: run
  name: task 1
  script: \env
  docker:
    image: alpine

- type: run
  name: task 2
  script: \env
  docker:
    image: alpine
