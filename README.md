# puredns-docker

Docker container for [puredns](https://github.com/d3mondev/puredns) - a fast domain resolver and subdomain bruteforcing tool.

## Quick Start

```bash
docker run --rm -i -v $(PWD):/data ghcr.io/jackwillis/puredns-docker [command] [args]
```

Files in your current directory are accessible to the container.

## Examples

```bash
# Resolve domains
docker run --rm -i -v $(PWD):/data ghcr.io/jackwillis/puredns-docker resolve domains.txt

# Bruteforce subdomains
docker run --rm -i -v $(PWD):/data ghcr.io/jackwillis/puredns-docker bruteforce wordlist.txt example.com

# Use custom resolvers
docker run --rm -i -v $(PWD):/data ghcr.io/jackwillis/puredns-docker resolve domains.txt -r resolvers.txt
```
