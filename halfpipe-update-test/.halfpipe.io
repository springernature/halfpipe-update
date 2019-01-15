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
  script: \env && echo $GIT_REVISION > git-rev
  save_artifacts:
  - git-rev
  docker:
    image: alpine

- type: run
  name: task 2
  script: \env && echo content of artifact file = && cat git-rev
  restore_artifacts: true
  docker:
    image: alpine

- type: run
  name: task 4
  script: \env && echo content of artifact file = && cat git-rev
  restore_artifacts: true
  docker:
    image: alpine

- type: run
  name: task 5
  script: \env && echo content of artifact file = && cat git-rev
  restore_artifacts: true
  docker:
    image: alpine
