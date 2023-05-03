# DOCKER image to run odoo 14 with Odoo Community Backports and OCA addons
FROM debian:11.7
MAINTAINER Rubén Cabrera Martínez <dev@rubencabrera.es>
EXPOSE 8069 8071 8072
ENV LANG C.UTF-8

RUN apt-get update \
    && apt-get install \
    software-properties-common \
    wget \
    gnupg2 \
    -y

RUN add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" -y; \
    wget --quiet -O - https://postgresql.org/media/keys/ACCC4CF8.asc | \
    apt-key add -

RUN apt-get update && apt-get install \
        git \
        libssl-dev \
        locales \
        net-tools \
        node-clean-css \
        node-less \
	postgresql-client-9.6 \
        python3-apt \
        python3-babel \
        python3-cups \
        python3-dateutil \
        python3-decorator \
        python3-dev \
        python3-docutils \
        python3-feedparser \
        python3-gevent \
        python3-geoip \
        python3-jinja2 \
        python3-lxml \
        python3-mako \
        python3-mock \
        python3-openid \
        python3-openssl \
        python3-passlib \
        python3-pip \
        python3-psutil \
        python3-psycopg2 \
        python3-pydot \
        python3-pyinotify \
        python3-pyldap \
        python3-pyparsing \
        python3-pypdf2 \
        python3-qrcode \
        python3-renderpm \
        python3-reportlab \
        python3-requests \
        python3-simplejson \
        python3-tz \
        python3-unicodecsv \
        python3-unittest2 \
        python3-vatnumber \
        python3-vobject \
        python3-watchdog \
        python3-werkzeug \
        python3-yaml \
        xauth \
        xfonts-75dpi \
        xfonts-base \
        xfonts-utils \
        -y

RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb
RUN dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb

RUN pip3 install \
        backports.functools_lru_cache \
	bokeh \
        cssutils \
        dbfpy \
        html2text \
        libsass \
	odoorpc \
	ofxparse \
        openupgradelib \
        num2words \
	pandas \
	phonenumbers \
	polib \
        psycogreen \
	twilio \
        unidecode \
        xlrd \
	zeep \
	zklib
