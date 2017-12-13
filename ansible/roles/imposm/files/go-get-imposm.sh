#!/usr/bin/env bash

test -d ~/go || mkdir  ~/go ; cd ~/go

/usr/local/go/bin/go get github.com/omniscale/imposm3
/usr/local/go/bin/go install github.com/omniscale/imposm3/cmd/imposm3
