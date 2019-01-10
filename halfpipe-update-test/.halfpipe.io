team: engineering-enablement
pipeline: halfpipe-update-test

feature_toggles:
- update-pipeline

repo:
  watched_paths:
  - halfpipe-update-test

tasks:
- type: run
  script: /bin/echo task 1
  docker:
    image: alpine

- type: run
  script: /bin/echo task 2
  docker:
    image: alpine

- type: run
  script: /bin/echo task 3
  docker:
    image: alpine
