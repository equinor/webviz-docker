![webviz-docker](https://github.com/equinor/webviz-docker/workflows/webviz-docker/badge.svg)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/19233b7ef4ce43199ffd7b0cf9e41e66)](https://www.codacy.com/app/anders-kiaer/webviz-docker?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=equinor/webviz-docker&amp;utm_campaign=Badge_Grade)
![Docker Pulls](https://img.shields.io/docker/pulls/webviz/base_image.svg)
![MicroBadger Size (tag)](https://img.shields.io/microbadger/image-size/webviz/base_image/latest.svg)
![MicroBadger Layers (tag)](https://img.shields.io/microbadger/layers/webviz/base_image/latest.svg)

# Webviz-config docker image

This repository is building and deploying a
[`webviz-config`](https://github.com/equinor/webviz-config) Docker base image
to the [Dockerhub webviz repository](https://hub.docker.com/u/webviz).

Every Sunday or when the GitHub workflow is triggered manually, the base image on
Dockerhub will be updated, which then can be used by `webviz-config`.

The image is using the [`meinheld`](https://github.com/mopemope/meinheld)+
[`gunicorn`](https://github.com/benoitc/gunicorn) stack for serving the
[`dash`](https://github.com/plotly/dash)+[`flask`](https://github.com/pallets/flask)
applications created by [`webviz-config`](https://github.com/equinor/webviz-config).
