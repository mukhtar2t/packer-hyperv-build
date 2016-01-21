FROM alpine:3.2

RUN apk --update add go git alpine-sdk bzr mercurial bash
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN go get -u github.com/mitchellh/gox
RUN git clone https://github.com/mitchellh/packer $GOPATH/src/github.com/mitchellh/packer
WORKDIR $GOPATH/src/github.com/mitchellh/packer
RUN git stash && \
    make updatedeps
RUN git fetch origin pull/2576/head:hyperv && \
    git checkout hyperv

RUN XC_OS="linux windows" XC_ARCH="amd64" make bin 
CMD ["go","run","main.go"]
