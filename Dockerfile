FROM golang:alpine AS builder

RUN apk add --no-cache git make gcc musl-dev curl

WORKDIR /opt
RUN git clone --depth 1 --branch v1.1.0 https://github.com/blechschmidt/massdns.git
RUN cd massdns && make && make install

RUN go install github.com/d3mondev/puredns/v2@latest

# Download list of trusted public DNS resolvers
# https://github.com/trickest/resolvers
RUN curl --fail --silent --show-error --location \
    --output resolvers-trusted.txt \
    https://raw.githubusercontent.com/trickest/resolvers/refs/heads/main/resolvers-trusted.txt \
    && test -s resolvers-trusted.txt || (echo "Failed to download resolvers file" && exit 1)

FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /usr/local/bin/massdns /usr/local/bin/
COPY --from=builder /go/bin/puredns /usr/local/bin/
COPY --from=builder /opt/resolvers-trusted.txt /root/.config/puredns/resolvers.txt

WORKDIR /data
ENTRYPOINT ["/usr/local/bin/puredns"]
