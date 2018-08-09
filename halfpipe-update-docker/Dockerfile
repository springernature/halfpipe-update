FROM alpine

RUN apk --no-cache add wget
RUN apk --no-cache add ca-certificates
RUN apk --no-cache add bash
RUN apk --no-cache add git

# Just get a random Fly version. We will sync in the script later
RUN wget -O /bin/fly "https://concourse.halfpipe.io/api/v1/cli?arch=amd64&platform=linux"
RUN chmod +x /bin/fly

# Just get a random Halfpipe version. We will sync in the script later
RUN wget -O /bin/halfpipe "https://github.com/springernature/halfpipe/releases/download/1.52.1/halfpipe_linux_1.52.1"
RUN chmod +x /bin/halfpipe

# We need a ~/.flyrc with at least a api configured, otherwise fly sync cannot complete
ADD .flyrc /root/.flyrc

ADD update-pipeline /bin/update-pipeline
