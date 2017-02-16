FROM frolvlad/alpine-glibc:alpine-3.4

MAINTAINER euforia

RUN apk add --update ca-certificates

ADD ./nomad /usr/bin/

ENTRYPOINT ["/usr/bin/nomad"]
