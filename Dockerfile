FROM tiangolo/uwsgi-nginx-flask:python3.7

################################
# Install the webviz ecosystem #
################################

# 1) Install necessary Python packages.
# 2) Change from full plotly bundle to one not depending on javascript eval.
#    See https://github.com/plotly/dash-core-components/issues/462 for details.

# When docker build squash argument is not experimental, the commands can
# be split out without increasing image size.

RUN pip install --upgrade pip webviz-config webviz-subsurface --no-cache-dir \
    && DCC_DIR='/usr/local/lib/python3.7/site-packages/dash_core_components' \
    && PLOTLY_VERSION=`ls $DCC_DIR/plotly-*.min.js | egrep -o '[0-9]+.[0-9]+.[0-9]+'` \
    && wget https://github.com/plotly/plotly.js/raw/v$PLOTLY_VERSION/dist/plotly-cartesian.min.js \
    && mv plotly-cartesian.min.js $DCC_DIR/plotly-cartesian-$PLOTLY_VERSION.min.js \
    && sed -i "s/plotly-$PLOTLY_VERSION.min.js/plotly-cartesian-$PLOTLY_VERSION.min.js/g" $DCC_DIR/__init__.py

##############################################
# Prepare for adding the webviz instance app #
##############################################

ENV LISTEN_PORT=5000 UWSGI_INI=/uwsgi.ini STATIC_URL=/dash_app/assets

EXPOSE 5000

COPY uwsgi.ini /

WORKDIR /dash_app
