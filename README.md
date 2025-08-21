# puredns-docker

[![Build and Push Docker Image](https://github.com/jackwillis/puredns-docker/actions/workflows/docker-build.yaml/badge.svg)](https://github.com/jackwillis/puredns-docker/actions/workflows/docker-build.yaml)

Docker container for [**puredns**](https://github.com/d3mondev/puredns) - a fast domain resolver and subdomain bruteforcing tool based on [**massdns**](https://github.com/blechschmidt/massdns).

Automatically rebuilt weekly with puredns `v2@latest` and massdns [`70331f6`](https://github.com/blechschmidt/massdns/commit/70331f618410de87d0eb478a290ec7f085831d4f).

```bash
docker pull jackwillis/puredns
```

## Performance considerations

The Linux version of massdns (which powers puredns) uses [`epoll`](https://en.wikipedia.org/wiki/Epoll) for high-performance concurrent DNS queries. This container packages the optimized Linux build with pre-configured resolvers from [**trickest/resolvers**](https://github.com/trickest/resolvers).

**macOS users:** Unfortunately, both native puredns and Docker Desktop on macOS have significant performance limitations. For intensive DNS resolution tasks, you'll need to run this container on an actual Linux server.

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
