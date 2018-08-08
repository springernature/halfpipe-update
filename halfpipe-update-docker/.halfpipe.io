team: engineering-enablement
pipeline: halfpipe-update-docker
repo:
  watched_paths:
  - halfpipe-update-docker
tasks:
- type: docker-push
  image: eu.gcr.io/halfpipe-io/halfpipe-update
