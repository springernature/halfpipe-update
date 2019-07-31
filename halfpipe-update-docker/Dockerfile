FROM debian:buster-slim

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
RUN curl -Lo /bin/halfpipe "https://github.com/springernature/halfpipe/releases/download/3.6.4/halfpipe_linux_3.6.4" \
    && chmod +x /bin/halfpipe \
    && halfpipe sync

ADD update-pipeline* /bin/
