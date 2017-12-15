FROM fluent/fluentd-kubernetes-daemonset:v0.12-debian-elasticsearch

MAINTAINER Shane Lee <shanelee007@gmail.com>

USER root

RUN buildDeps="build-essential libgeoip-dev ruby-dev  libmaxminddb-dev" \
     && apt-get update \
     && apt-get install \
     -y --no-install-recommends \
     $buildDeps \
     && gem install fluent-plugin-geoip \
 && rm -rf /var/lib/apt/lists/* \
    && gem sources --clear-all \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem
