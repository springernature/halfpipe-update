FROM debian:buster-slim

ENV TERM xterm-256color

RUN apt-get update && apt-get install -y \
    git \
    jq \
    curl \
    ca-certificates \
    && apt-get autoremove -y \
    && apt-get clean

# Get current version of fly
RUN curl -Lo /bin/fly "https://concourse.halfpipe.io/api/v1/cli?arch=amd64&platform=linux" \
    && chmod +x /bin/fly

# Get Halfpipe and sync to latest version
RUN curl -Lo /bin/halfpipe "https://github.com/springernature/halfpipe/releases/download/3.60.0/halfpipe_linux_3.60.0" \
    && chmod +x /bin/halfpipe \
    && halfpipe sync

# get yq
RUN curl -Lo /usr/bin/yq "https://github.com/mikefarah/yq/releases/download/v4.27.3/yq_linux_amd64" \
  && chmod +x /usr/bin/yq

ADD update-pipeline* /bin/
