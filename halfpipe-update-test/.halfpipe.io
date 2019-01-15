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
  script: \env && echo git revision is $GIT_REVISION > git-rev
  save_artifacts:
  - git-rev
  docker:
    image: alpine

- type: run
  name: task 2
  script: \env && cat git-rev
  restore_artifacts: true
  docker:
    image: alpine
