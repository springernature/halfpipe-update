team: engineering-enablement
pipeline: halfpipe-update-test

feature_toggles:
- update-pipeline

repo:
  watched_paths:
  - halfpipe-update-test

tasks:
- type: run
  script: \env
  docker:
    image: alpine
