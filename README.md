# puredns-docker

Docker container for [puredns](https://github.com/d3mondev/puredns).

## Usage

```bash
docker run --rm -i -v $(PWD):/data ghcr.io/jackwillis/puredns-docker [args]
```

The container mounts your current directory to `/data` inside the container, which is also the working directory.
This allows you to use relative file paths naturally:

### Examples

```bash
# Resolve a list of domains
docker run --rm -i -v $(PWD):/data ghcr.io/jackwillis/puredns-docker resolve domains.txt

# Bruteforce subdomains using a wordlist
docker run --rm -i -v $(PWD):/data ghcr.io/jackwillis/puredns-docker bruteforce wordlist.txt example.com

# With resolvers file
docker run --rm -i -v $(PWD):/data ghcr.io/jackwillis/puredns-docker resolve domains.txt -r resolvers.txt
```

All file paths in the arguments are relative to your current directory, making it easy to work with local files.
