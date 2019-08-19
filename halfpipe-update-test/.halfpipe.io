team: engineering-enablement
pipeline: halfpipe-update-test

feature_toggles:
- update-pipeline

repo:
  watched_paths:
  - halfpipe-update-test

tasks:
- type: run
  name: run1
  script: \env
  docker:
    image: alpine

- type: run
  name: run9
  script: \env
  docker:
    image: alpine
  vars:
    FOO: foo2
