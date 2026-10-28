#!/bin/sh
set -e
docker rm -f some-pingpong
docker build -t pingpong .
docker run --name some-pingpong -p8080:80 -itd pingpong
curl -sSf http://localhost:8080/ping | grep -q 'pong'
curl -sSf http://localhost:8080/encoded | base64 -d | grep -q 'pong'
