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

- type: run
  name: task.2
  script: /bin/echo task 2
  docker:
    image: alpine

- type: run
  name: task.3
  script: /bin/echo task 3
  docker:
    image: alpine

- type: run
  name: task.4
  script: /bin/echo task 4
  docker:
    image: alpine

- type: run
  name: task.5
  script: /bin/echo task 5
  docker:
    image: alpine

- type: run
  name: task.6
  script: /bin/echo task 6
  docker:
    image: alpine

- type: run
  name: task.7
  script: /bin/echo task 7
  docker:
    image: alpine
