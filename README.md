# puredns-docker

Docker container for [puredns](https://github.com/d3mondev/puredns) - a fast domain resolver and subdomain bruteforcing tool.

Pinned to puredns `v2@latest` and massdns `70331f6`. Automatically rebuilt weekly.

## Why Docker?

While [massdns](https://github.com/blechschmidt/massdns) can be compiled for macOS, the Linux version uses `epoll` for significantly better performance with concurrent DNS queries. This Docker container provides the Linux build, simplifies installation, and includes pre-configured trusted DNS resolvers.

## Quick Start

```bash
docker run --rm -it -v $(PWD):/data ghcr.io/jackwillis/puredns --help
```

Files in your current directory are accessible to the container.
