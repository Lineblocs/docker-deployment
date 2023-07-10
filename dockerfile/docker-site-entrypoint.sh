#!/bin/sh
set -e

# write the to .env
{ \
    echo DB_HOST="$DB_HOST" ; \
    echo DB_USERNAME="$DB_USERNAME" ; \
    echo  DB_PASSWORD="$DB_PASSWORD" ; \
    echo  DB_DATABASE="$DB_DATABASE" ; \
    echo  DB_PORT="$DB_PORT" ; \
} >> .env


/var/www/html/entrypoint.sh

exec "$@"