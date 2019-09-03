#!/bin/bash

set -e

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push webviz/base_image:latest
docker push webviz/example_image:latest
