# puredns-docker

Docker container for [puredns](https://github.com/d3mondev/puredns) - a fast domain resolver and subdomain bruteforcing tool.

Pinned to puredns `v2@latest`. Automatically rebuilt weekly.

## Quick Start

```bash
docker run --rm -it -v $(PWD):/data ghcr.io/jackwillis/puredns --help
```

Files in your current directory are accessible to the container.
