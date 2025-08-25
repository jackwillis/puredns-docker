# puredns-docker

[![Build and Push Docker Image](https://github.com/jackwillis/puredns-docker/actions/workflows/docker-build.yaml/badge.svg)](https://github.com/jackwillis/puredns-docker/actions/workflows/docker-build.yaml)
[![Docker Hub: jackwillis/puredns](https://img.shields.io/badge/Docker_Hub-jackwillis%2Fpuredns-blue?logo=docker)](https://hub.docker.com/r/jackwillis/puredns)

Docker container for [**puredns**](https://github.com/d3mondev/puredns) - a fast domain resolver and subdomain bruteforcing tool based on [**massdns**](https://github.com/blechschmidt/massdns).

Automatically rebuilt weekly with puredns `v2@latest` and massdns [`v1.1.0-15-g70331f6`](https://github.com/blechschmidt/massdns/commit/70331f618410de87d0eb478a290ec7f085831d4f). Includes pre-configured resolvers from [**trickest/resolvers**](https://github.com/trickest/resolvers).

```bash
docker pull jackwillis/puredns
```

## Performance considerations

**macOS users:** Native massdns on macOS lacks [`epoll`](https://en.wikipedia.org/wiki/Epoll) support, limiting performance. This container provides the optimized Linux build, but Docker Desktop adds its own overhead on macOS. For best results, run on a Linux host or VM (UTM, VMware, etc.) rather than Docker Desktop.

## Usage

```bash
# Basic usage
docker run --rm -it -v $(pwd):/data jackwillis/puredns --help

# Resolve domains
docker run --rm -it -v $(pwd):/data jackwillis/puredns resolve domains.txt

# Bruteforce subdomains
docker run --rm -it -v $(pwd):/data jackwillis/puredns bruteforce wordlist.txt example.com

# Pull latest Docker image
docker pull jackwillis/puredns
```

Files in your current directory are accessible to the container via the `/data` volume mount.

## Fish shell integration

If you use Fish shell, run this once to add aliases and tab completions:

```fish
function puredns --description "Run puredns via Docker"
    docker run --rm -it -v (pwd):/data jackwillis/puredns $argv
end
funcsave puredns

function puredns-update --description "Update puredns Docker image"
    docker pull jackwillis/puredns
end
funcsave puredns-update

# Tab completions
echo '
complete -c puredns -f
complete -c puredns -n __fish_use_subcommand -a resolve -d "Resolve domains from file"
complete -c puredns -n __fish_use_subcommand -a bruteforce -d "Bruteforce subdomains"
complete -c puredns -n __fish_use_subcommand -a sponsors -d "Show sponsors"
complete -c puredns -n "__fish_seen_subcommand_from resolve" -F -d "Domains file"
complete -c puredns -n "__fish_seen_subcommand_from bruteforce" -F -d "Wordlist file"
' > ~/.config/fish/completions/puredns.fish
```

Usage examples:

```fish
puredns resolve domains.txt
puredns bruteforce wordlist.txt example.com
puredns-update  # Pull latest Docker image
```
