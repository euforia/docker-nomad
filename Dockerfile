FROM frolvlad/alpine-glibc:alpine-3.4

MAINTAINER euforia

ENV NOMAD_VERSION=0.5.4 \
    NOMAD_SHA256=ed9eb471b9f5bab729cfa402db5aa56e1d935c328ac48327267e0ea53568d5c2

RUN apk add --update ca-certificates wget && \
    wget -O /nomad_${NOMAD_VERSION}_linux_amd64.zip https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip && \
    echo "${NOMAD_SHA256}  nomad_${NOMAD_VERSION}_linux_amd64.zip" > /nomad.sha256 && \
    sha256sum -c /nomad.sha256 && \
    cd /usr/local/bin && \
    unzip /nomad_${NOMAD_VERSION}_linux_amd64.zip && \
    apk del ca-certificates wget && \
    rm -rfv /nomad* /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/nomad"]
