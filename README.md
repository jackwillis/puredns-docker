# puredns-docker

Docker container for [puredns](https://github.com/d3mondev/puredns) - a fast domain resolver and subdomain bruteforcing tool.

Pinned to puredns `v2@latest` and massdns `70331f6`. Automatically rebuilt weekly.

## Why Docker?

While [massdns](https://github.com/blechschmidt/massdns) can be compiled for macOS, the Linux version uses `epoll` for significantly better performance with concurrent DNS queries. This Docker container provides the Linux build, simplifies installation, and includes pre-configured trusted DNS resolvers.

## Quick Start

```bash
docker run --rm -v $(PWD):/data ghcr.io/jackwillis/puredns --help
```

Files in your current directory are accessible to the container.

## Fish support

To add `puredns`, `puredns-update`, and tab completions to your environment, run this once:

```fish
function puredns --description "Run puredns via Docker"
    docker run --rm -v (pwd):/data ghcr.io/jackwillis/puredns $argv
end
funcsave puredns

function puredns-update --description "Update puredns Docker image"
    docker pull ghcr.io/jackwillis/puredns
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
