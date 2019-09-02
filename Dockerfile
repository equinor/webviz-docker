FROM python:3.7-slim

LABEL maintainer="Equinor R&T"

EXPOSE 5000

ARG PIP_PACKAGES

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
         wget \
         gcc \
         libgcc-8-dev \
         gcc-8 \
         libc-dev-bin \
         libc6-dev \
    && pip install --no-cache-dir $PIP_PACKAGES \
    && apt-get purge -y \
         wget \
         gcc \
         libgcc-8-dev \
         gcc-8 \
         libc-dev-bin \
         libc6-dev \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --create-home appuser

WORKDIR /home/appuser
USER appuser

COPY --chown=appuser . .

CMD gunicorn \
      --config="./gunicorn_conf.py" \
      "dash_app.webviz_app:server"
