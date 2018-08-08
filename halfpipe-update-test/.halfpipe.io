team: engineering-enablement
pipeline: halfpipe-update-test
auto_update: true

repo:
  watched_paths:
  - halfpipe-update-test

tasks:
- type: run
  name: task 1
  script: /bin/echo task 1
  docker:
    image: alpine

- type: run
  name: task 2
  script: /bin/echo task 2
  docker:
    image: alpine

- type: run
  name: task 3
  script: /bin/echo task 3
  docker:
    image: alpine

- type: run
  name: task IV
  script: /bin/echo task iv
  docker:
    image: alpine

- type: run
  name: task V
  script: /bin/echo task v
  docker:
    image: alpine
