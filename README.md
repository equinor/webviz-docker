[![Build Status](https://travis-ci.org/equinor/webviz-docker.svg?branch=master)](https://travis-ci.org/equinor/webviz-docker)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/19233b7ef4ce43199ffd7b0cf9e41e66)](https://www.codacy.com/app/anders-kiaer/webviz-docker?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=equinor/webviz-docker&amp;utm_campaign=Badge_Grade)

# Build webviz docker image

This repository is building and deploying a `webviz` Docker base image
to the [webviz Dockerhub repository](https://hub.docker.com/u/webviz).

Every time a new tag is released in this repository, the base image on
Dockerhub will be updated, which then can be used by `webviz-config`.

This repository is in alpha.
