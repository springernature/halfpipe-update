team: engineering-enablement
pipeline: halfpipe-update-docker
slack_channel: "#ee-release-engineering"

feature_toggles:
- update-pipeline

triggers:
- type: git
  watched_paths:
  - halfpipe-update-docker
- type: timer
  cron: "0 3 * * *"
- type: pipeline
  pipeline: halfpipe-cli
  job: Release

tasks:
- type: docker-push
  image: eu.gcr.io/halfpipe-io/halfpipe-auto-update
