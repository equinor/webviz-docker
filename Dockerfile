FROM python:3.7-slim
# TODO: Choose base image based on Python minor system used by user

EXPOSE 5000

# TODO: Only install git when actually needed by one or more plugin projects
RUN useradd --create-home appuser \
        && apt-get update \
        && apt-get install -y --no-install-recommends git \
        && apt-get purge -y --auto-remove \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /home/appuser
USER appuser

ENV PATH="${PATH}:/home/appuser/.local/bin" \
    PYTHONFAULTHANDLER=1

# TODO: webviz-config and plugin dependencies to be pinned
RUN pip install --no-cache-dir \
        gunicorn \
        webviz-config==0.* \
        webviz-subsurface==0.*

COPY --chown=appuser . .

CMD gunicorn \
        --config="./gunicorn_conf.py" \
        "dash_app.webviz_app:server"
