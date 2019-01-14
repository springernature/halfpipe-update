team: engineering-enablement
pipeline: halfpipe-update-test

feature_toggles:
- update-pipeline

repo:
  uri: https://github.com/springernature/halfpipe-update.git
  watched_paths:
  - halfpipe-update-test

tasks:
- type: run
  script: /bin/echo task 1
  docker:
    image: alpine

- type: run
  script: /bin/echo task 2a
  docker:
    image: alpine
