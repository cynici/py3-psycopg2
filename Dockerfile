FROM python:3.6-alpine
LABEL maintainer "Cheewai Lai <clai@csir.co.za?"

ARG DEBIAN_FRONTEND=noninteractive
ARG SUEXEC_VER=0.2

RUN echo "http://nl.alpinelinux.org/alpine/edge/main" >>/etc/apk/repositories \
 && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >>/etc/apk/repositories \
 && echo "http://nl.alpinelinux.org/alpine/edge/testing" >>/etc/apk/repositories \
 && apk --update-cache add py3-psycopg2 py3-raven py3-requests su-exec \
 && rm -rf /var/cache/apk/*

# apk installed Python modules not found without this
ENV PYTHONPATH=/usr/lib/python3.6/site-packages
ADD docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
