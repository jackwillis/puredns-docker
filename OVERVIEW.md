Unofficial Docker container for [puredns](https://github.com/d3mondev/puredns), maintained as the upstream project does not provide Docker support.

## Container details

- Base: Alpine Linux
- puredns Version: [v2 (latest)](https://github.com/d3mondev/puredns)
- massdns Version: [v1.1.0-15-g70331f6](https://github.com/blechschmidt/massdns/commit/70331f618410de87d0eb478a290ec7f085831d4f)
- Resolvers: Pre-configured from https://github.com/trickest/resolvers
- Update Schedule: [Weekly automated builds](https://github.com/jackwillis/puredns-docker/actions/workflows/docker-build.yaml) via GitHub Actions

## Usage

### Basic usage
```bash
docker run --rm -it -v $(pwd):/data jackwillis/puredns --help
```

### Resolve domains
```bash
docker run --rm -it -v $(pwd):/data jackwillis/puredns resolve domains.txt
```

### Bruteforce subdomains
```bash
docker run --rm -it -v $(pwd):/data jackwillis/puredns bruteforce wordlist.txt example.com
```

Files in your current directory are accessible via the /data volume mount.

## Performance Notes

- Performance on Docker Desktop under macOS is significantly limited compared to Linux or Windows

## Links

- https://github.com/jackwillis/puredns-docker
- https://github.com/jackwillis/puredns-docker#fish-shell-integration
- https://github.com/d3mondev/puredns
- https://github.com/jackwillis/puredns-docker/actions/workflows/docker-build.yaml
