FROM alpine

RUN apk --no-cache add wget ca-certificates bash git jq curl

# Just get a random Fly version. We will sync in the script later
RUN wget -O /bin/fly "https://concourse.halfpipe.io/api/v1/cli?arch=amd64&platform=linux"
RUN chmod +x /bin/fly

# Just get a random Halfpipe version. We will sync in the script later
RUN wget -O /bin/halfpipe "https://github.com/springernature/halfpipe/releases/download/3.0.1/halfpipe_linux_3.0.1"
RUN chmod +x /bin/halfpipe

RUN /bin/halfpipe sync

# We need a ~/.flyrc with at least a api configured, otherwise fly sync cannot complete
ADD .flyrc /root/.flyrc

ADD update-pipeline /bin/update-pipeline
