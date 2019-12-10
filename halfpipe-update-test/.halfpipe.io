team: engineering-enablement
pipeline: halfpipe-update-test

feature_toggles:
- update-pipeline

triggers:
- type: git
  watched_paths:
  - halfpipe-update-test

tasks:
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
