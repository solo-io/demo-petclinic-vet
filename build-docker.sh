#!/bin/bash
set -ex

GOOS=linux CGO_ENABLED=0 go build -gcflags "-N -l"
docker build -t soloio/petclinic-vet:v0.1 .
