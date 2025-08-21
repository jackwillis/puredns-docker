# puredns-docker

Docker container for [puredns](https://github.com/d3mondev/puredns) - a fast domain resolver and subdomain bruteforcing tool.

Pinned to puredns `v2@latest`. Automatically rebuilt weekly.

## Why Docker?

The [massdns](https://github.com/blechschmidt/massdns) dependency uses Linux-specific system calls (`epoll`) that are not available on macOS. This Docker container provides cross-platform compatibility while simplifying installation. It includes pre-configured trusted DNS resolvers.

## Quick Start

```bash
docker run --rm -it -v $(PWD):/data ghcr.io/jackwillis/puredns --help
```

Files in your current directory are accessible to the container.
