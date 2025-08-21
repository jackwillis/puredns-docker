FROM golang:alpine AS builder

RUN apk add --no-cache git make gcc musl-dev

WORKDIR /opt
RUN git clone https://github.com/blechschmidt/massdns.git
RUN cd massdns && make && make install

RUN go install github.com/d3mondev/puredns/v2@latest

FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY --from=builder /usr/local/bin/massdns /usr/local/bin/
COPY --from=builder /go/bin/puredns /usr/local/bin/

WORKDIR /data
ENTRYPOINT ["/usr/local/bin/puredns"]
