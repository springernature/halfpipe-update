team: engineering-enablement
pipeline: halfpipe-update-test
auto_update: true

repo:
  watched_paths:
  - halfpipe-update-test

tasks:
- type: run
  name: task.1
  script: /bin/echo task 1
  docker:
    image: alpine

