#!/bin/bash

GOOS=linux CGO_ENABLED=0 go build
docker build -t petclinic-vet .