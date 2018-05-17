FROM frolvlad/alpine-python3
LABEL maintainer "Cheewai Lai <clai@csir.co.za?"

ARG DEBIAN_FRONTEND=noninteractive
ARG SUEXEC_VER=0.2
ARG DOCKERIZE_VERSION=v0.5.0

RUN echo "http://nl.alpinelinux.org/alpine/edge/main" >>/etc/apk/repositories \
 && echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >>/etc/apk/repositories \
 && echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >>/etc/apk/repositories \
 && apk update \
 && apk add --upgrade apk-tools \
 && apk add py3-dateutil py3-numpy@community py3-psycopg2 py3-raven@community py3-requests su-exec openssl \
 && pip install --upgrade pip \
 && pip install rethinkdb \
 && python -c "import rethinkdb" \
 && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && tar -C /usr/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && rm -rf /var/cache/apk/* \
 && test -e /usr/bin/python || ln -s /usr/bin/python3 /usr/bin/python

# apk installed Python modules not found without this
ENV PYTHONPATH=/usr/lib/python3.6/site-packages
ADD docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
