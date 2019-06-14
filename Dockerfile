FROM python:3.7-slim

LABEL maintainer="Equinor R&T"

EXPOSE 5000

ENV DCC_DIR="/usr/local/lib/python3.7/site-packages/dash_core_components"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
         wget \
         gcc \
         libgcc-6-dev \
         gcc-6 \
         libc-dev-bin \
         libc6-dev \
    && pip install --no-cache-dir \
         meinheld \
         gunicorn \
         flask \
         webviz-config \
         webviz-subsurface \ 
    && PLOTLY_VERSION=`ls $DCC_DIR/plotly-*.min.js | egrep -o "[0-9]+.[0-9]+.[0-9]+"` \
    && wget https://github.com/plotly/plotly.js/raw/v$PLOTLY_VERSION/dist/plotly-cartesian.min.js \
    && mv plotly-cartesian.min.js $DCC_DIR/plotly-cartesian-$PLOTLY_VERSION.min.js \
    && sed -i "s/plotly-$PLOTLY_VERSION.min.js/plotly-cartesian-$PLOTLY_VERSION.min.js/g" $DCC_DIR/__init__.py \
    && apt-get purge -y \
         wget \
         gcc \
         libgcc-6-dev \
         gcc-6 \
         libc-dev-bin \
         libc6-dev \
    && apt-get autoremove -y \
    && apt-get clean \
    && useradd --create-home appuser

WORKDIR /home/appuser
USER appuser

COPY --chown=appuser . .

CMD gunicorn \
      --config="./gunicorn_conf.py" \
      "dash_app.webviz_app:server"
