FROM quay.io/coreos/fluentd-kubernetes:v0.12-debian-elasticsearch

MAINTAINER Shane Lee <shanelee007@gmail.com>

RUN buildDeps="build-essential curl libgeoip-dev ruby-dev  libmaxminddb-dev" \
     && apt-get update \
     && apt-get install \
     -y --no-install-recommends \
     $buildDeps \
     && gem install fluent-plugin-geoip \
     && gem install fluent-plugin-forest \
     && cd /home/fluent \
     && curl http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz | gzip -d > GeoLiteCity.dat \
 && rm -rf /var/lib/apt/lists/* \
    && gem sources --clear-all \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem
