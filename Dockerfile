FROM tiangolo/uwsgi-nginx-flask:python3.7

################################
# Install the webviz ecosystem #
################################

RUN pip install -U pip

RUN pip install webviz-config #webviz-subsurface 

# The plotly version must be calculated outside the Dockerfile,
# because this line does not work within Docker 
# PLOTLY_VERSION=`ls $DCC_DIR/plotly-*.min.js | egrep -o '[0-9]+.[0-9]+.[0-9]+'`

ENV PLOTLY_VERSION=1.44.3
ENV DCC_DIR='/usr/local/lib/python3.7/site-packages/dash_core_components'

RUN wget https://github.com/plotly/plotly.js/raw/v$PLOTLY_VERSION/dist/plotly-cartesian.min.js
RUN mv plotly-cartesian.min.js $DCC_DIR/plotly-cartesian-$PLOTLY_VERSION.min.js

RUN sed -i "s/plotly-$PLOTLY_VERSION.min.js/plotly-cartesian-$PLOTLY_VERSION.min.js/g" $DCC_DIR/__init__.py 

##############################################
# Prepare for adding the webviz instance app #
##############################################

ENV LISTEN_PORT=5000
EXPOSE 5000

COPY uwsgi.ini /

ENV UWSGI_INI /uwsgi.ini
ENV STATIC_URL /dash_app/assets

WORKDIR /dash_app
