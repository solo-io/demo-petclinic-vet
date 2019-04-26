FROM golang:1.12-alpine3.9 as build_base
RUN apk add --no-cache git
WORKDIR $GOPATH/src/github.com/sololabs/petclinic-vet

ENV GO111MODULE=on

COPY go.mod .
COPY go.sum .

RUN go mod download

FROM build_base AS builder
COPY . ./
RUN GOOS=linux CGO_ENABLED=0 go build -gcflags "-N -l" -o /app

FROM alpine:3.9
CMD ["./app"]
COPY --from=builder /app ./
