# Install a certain Go version in WSL

Installing Go in WSL can be a pain. I created this script to automize the process. It's inspired by [this gist](https://gist.github.com/renevo/fad4db582b4f0edb9ecb767dec689474).

## How to run

`./install-go.sh <first-argument> -v <version> -o <OS> -a <architecture>`

### Flags

- `-v` version. Default as the first argument.
- `-o` OS. Default as "linux".
- `-a` architecture. Default as "amd64".

By default, `./install-go.sh 1.22.2` would install go 1.22.2.linux-amd64.

### Check all Go releases [here](https://go.dev/dl/)

**Important**: After running the script, make sure to change the [related environment variables](https://gist.github.com/renevo/fad4db582b4f0edb9ecb767dec689474#add-go-environment) in order to use the `go` command.
