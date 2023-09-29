# DOCKER image to run odoo 16 with Odoo Community Backports and OCA addons
FROM debian:bullseye
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
        xauth \
        xfonts-75dpi \
        xfonts-base \
        xfonts-utils \
        -y

# As/of 09292023, debian 12.1 does not have the necessary version of qt patched into its wkhtmltopdf package.
# Nor is a pre-built package available from thewkhtmltopdf project
# We've reverted to debian:bullseye (11) in order to leverage the following package.
# JaR - 09292023
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.bullseye_amd64.deb && \
        apt install -f ./wkhtmltox_0.12.6.1-2.bullseye_amd64.deb

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
