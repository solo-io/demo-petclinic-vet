#!/bin/bash

GOOS=linux CGO_ENABLED=0 go build -gcflags "-N -l"
docker build -t petclinic-vet .
