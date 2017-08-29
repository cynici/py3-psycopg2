# Python3 psycopg2

* Uses the official alpine python3 base image and includes psycopg2
* Includes raven to enable exception logging to [sentry.io](https://sentry.io/)
* Includes su-exec and docker-entrypoint.sh so container may run as non-root user

## Usage

Define environment variable `RUNUSER_UID` to the numeric uid value of an existing Linux user outside the container, the container will execute with the same uid.
