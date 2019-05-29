FROM alpine

RUN apk --no-cache add wget ca-certificates bash git jq curl

# Just get a random Fly version. We will sync in the script later
RUN wget -O /bin/fly "https://concourse.halfpipe.io/api/v1/cli?arch=amd64&platform=linux" && \
    chmod +x /bin/fly

# Just get a random Halfpipe version. We will sync in the script later
RUN wget -O /bin/halfpipe "https://github.com/springernature/halfpipe/releases/download/3.0.1/halfpipe_linux_3.0.1" && \
    chmod +x /bin/halfpipe && \
    /bin/halfpipe sync

ADD update-pipeline /bin/update-pipeline
