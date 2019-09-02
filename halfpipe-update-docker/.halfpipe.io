team: engineering-enablement
pipeline: halfpipe-update-docker
slack_channel: "#halfpipe-alerts"
cron_trigger: "0 3 * * *"

feature_toggles:
- update-pipeline

repo:
  watched_paths:
  - halfpipe-update-docker

tasks:
- type: docker-push
  image: eu.gcr.io/halfpipe-io/halfpipe-auto-update
