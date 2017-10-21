# Python3 psycopg2

* Uses the official alpine python3 base image and includes psycopg2
* Includes raven to enable exception logging to [sentry.io](https://sentry.io/)
* Includes [gosu](https://github.com/tianon/gosu)-like [su-exec](https://github.com/ncopa/su-exec) and docker-entrypoint.sh so container may run as non-root user

## Usage

Define environment variable `RUNUSER_UID` to the numeric uid value of an existing Linux user outside the container, the container will execute with the same uid.

## Why not use official alpine-python3 base image?

Using either of these base images, `python:3.6-alpine`, `python:3.5-alpine`,
results in package conflict:

```
ERROR: unsatisfiable constraints:
  readline-6.3.008-r4:
    conflicts: readline-7.0.003-r0
    satisfies:
               python3-3.5.2-r2[so:libreadline.so.6]
               .python-rundeps-0[so:libreadline.so.6]
  python3-3.5.2-r2:
    conflicts: python3-3.6.3-r3
               python3-3.6.3-r3[so:libpython3.so=0]
    satisfies: py3-urllib3-1.22-r0[python3]
               py3-chardet-3.0.4-r0[python3]
               py3-requests-2.18.4-r0[python3]
               py3-idna-2.6-r0[python3]
               py3-dateutil-2.6.1-r0[python3]
               py3-raven-6.2.0-r0[python3]
               py3-six-1.10.0-r6[python3]
               py3-certifi-2017.7.27.1-r0[python3]
  readline-7.0.003-r0:
    conflicts: readline-6.3.008-r4
    satisfies:
               python3-3.6.3-r3[so:libreadline.so.7]
  python3-3.6.3-r3:
    conflicts: python3-3.5.2-r2
               python3-3.5.2-r2[so:libpython3.so=0]
    satisfies: py3-urllib3-1.22-r0[python3]
               py3-chardet-3.0.4-r0[python3]
               py3-requests-2.18.4-r0[python3]
               py3-idna-2.6-r0[python3]
               py3-dateutil-2.6.1-r0[python3]
               py3-raven-6.2.0-r0[python3]
               py3-six-1.10.0-r6[python3]
               py3-certifi-2017.7.27.1-r0[python3]
               py3-psycopg2-2.7.3.1-r0[so:libpython3.6m.so.1.0]
               py3-numpy-1.13.3-r0[so:libpython3.6m.so.1.0]
```
