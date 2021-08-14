FROM golang:1.16-buster

ARG version=v0.0.0

RUN apt-get install -yqq gcc
WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . .

RUN mkdir -p ./bin

RUN go build -buildmode c-shared -o ./bin/fluent-kinesis-${version}.so ./
