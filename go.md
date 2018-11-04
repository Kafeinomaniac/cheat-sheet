## Run all go files except those ending with test

```bash
# ls -1 will print each statement in a new line, and grep -v will invert the search
$ go run $(ls -1 *.go | grep -v _test.go) 
```
## Building binary
Building a binary in the folder `bin` with the name `application` for linux


```bash
$ env GOOS=linux GOARCH=arm go build -v -o bin/application .
```

## Setting up gopath
For *nix system, look where `go` is installed, executing following command:

```bash
$ which go
```
which output let's say:

```bash
$ /usr/local/go/bin/go
```
then add following entries in `~/.bash_profile` or in `~/.zshrc`:

```bash
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
```

P.S: Don't forget to source ~/.bash_profile or ~/.zshrc, as follows:
```bash
$ source ~/.bash_profile
```

## copy or link the executables to /usr/local/bin

```bash
$ ln -s $GOPATH/bin/nomad-demo /usr/local/bin/nomad-demo
```


get number of fields in golang
``` 
x is a struct
		v := reflect.ValueOf(x)
		n = v.NumField() 
    ```

## Static Analysis

```bash
$ go build -gcflags "-m -m"
```

## Test Coverage 

```bash
# Create a test coverage output
$ go test -cover -coverprofile cover.out

# View it in html
$ go tool cover -html=cover.out
```

## Makefile for vgo

```bash
# Include all the environment variables from the .env file
include .env

# Export all environment variables for the current scope
export

# Install vgo and dependencies
install:
	@go version && go get -u golang.org/x/vgo

# Setup vendor folder locally
vendor:
	@vgo mod -vendor


# Start local development
start:
	@vgo run server/server.go
```


## Previewing Graphviz Diagram of depedencies

Need to point to `main` package. Then you can specify any packages you want to visualize
```bash
$ go-callvis -focus eth github.com/ethereum/go-ethereum/cmd/geth
```


## Example of dockerizing with C dependencies

```dockerfile
FROM golang:1.11.0-alpine3.8 as builder

RUN apk add --no-cache make gcc musl-dev linux-headers git

WORKDIR /go-c/

COPY . ./


RUN GO111MODULE=on CC=gcc go build -mod=vendor -o app

FROM alpine:3.8

WORKDIR /root/

ENV GIN_MODE=release

COPY --from=builder /go-c/app .

CMD ["./app"]
```
