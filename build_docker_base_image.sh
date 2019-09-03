#!/bin/bash

PIP_PACKAGES=$(echo $(<./requirements.txt) | tr "\n" " ")

docker build -t webviz/base_image . --build-arg PIP_PACKAGES="$PIP_PACKAGES"
