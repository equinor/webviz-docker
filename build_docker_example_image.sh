#!/bin/bash

set -e

WEBVIZ_CONFIG_VERSION=$(python -c "import webviz_config; print(webviz_config.__version__)")

git clone https://github.com/equinor/webviz-config.git

pushd webviz-config
git checkout $WEBVIZ_CONFIG_VERSION
popd

webviz certificate
webviz build webviz-config/examples/basic_example.yaml --portable ./example_app

pushd example_app
docker build -t webviz/example_image
popd
