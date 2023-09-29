# DOCKER image to run odoo 16 with Odoo Community Backports and OCA addons
FROM debian:12.1
MAINTAINER Joshua Restivo <jrestivo@jvxtechnology.com>
EXPOSE 8069 8071 8072
ENV LANG C.UTF-8

RUN apt-get update \
    && apt-get install \
    software-properties-common \
    wget \
    gnupg2 \
    -y

RUN add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" -y; \
    wget --quiet -O - https://postgresql.org/media/keys/ACCC4CF8.asc | \
    apt-key add -

RUN apt-get update && apt-get install \
        git \
        libssl-dev \
        locales \
        net-tools \
        node-clean-css \
        node-less \
	postgresql-client \
        python3-apt \
        python3-babel \
        python3-cups \
        python3-dateutil \
        python3-decorator \
        python3-dev \
        python3-docutils \
        python3-feedparser \
        python3-freezegun \
        python3-gevent \
        python3-geoip \
        python3-greenlet \
        python3-idna \
        python3-jinja2 \
        python3-ldap \
        python3-libsass \
        python3-lxml \
        python3-mako \
        python3-markupsafe \
        python3-mock \
        python3-openid \
        python3-openssl \
        python3-passlib \
        python3-pil \
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
        python3-serial \
        python3-simplejson \
        python3-stdnum \
        python3-tz \
        python3-unicodecsv \
        python3-unittest2 \
        python3-urllib3 \
        python3-usb \
        python3-venv \
        python3-vobject \
        python3-watchdog \
        python3-xlrd \
        python3-xlsxwriter \
        python3-xlwt \
        python3-yaml \
        python3-zeep \
        wkhtmltopdf \
        xauth \
        xfonts-75dpi \
        xfonts-base \
        xfonts-utils \
        -y

RUN python3 -m venv --system-site-packages /opt/venv; \
    . /opt/venv/bin/activate; \
    python3 -m pip install \
        backports.functools_lru_cache \
	bokeh \
        cssutils \
        dbfpy \
        ebaysdk \
        html2text \
        libsass \
	odoorpc \
	ofxparse \
        openupgradelib \
        num2words \
	pandas \
        passlib \
	phonenumbers \
	polib \
        pysftp \
        pytz \
        psycopg2-binary \
	twilio \
        unidecode \
        werkzeug Werkzeug==0.16.1 \
        xlrd \
	zeep \
	zklib
