FROM golang:alpine AS builder

RUN apk add --no-cache git make gcc musl-dev curl

WORKDIR /opt
RUN git clone https://github.com/blechschmidt/massdns.git
RUN cd massdns && make && make install

RUN go install github.com/d3mondev/puredns/v2@latest

RUN curl -O https://public-dns.info/nameservers.txt

FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY --from=builder /usr/local/bin/massdns /usr/local/bin/
COPY --from=builder /go/bin/puredns /usr/local/bin/
COPY --from=builder /opt/nameservers.txt /root/.config/puredns/resolvers.txt

WORKDIR /data
ENTRYPOINT ["/usr/local/bin/puredns"]
