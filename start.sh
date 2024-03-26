#!/bin/sh

set -e
# set -x

echo "run db migration"

# when use "docker compose up", do remark "source /app/app.env"
# source /app/app.env
# echo "DB_SOURCE: $DB_SOURCE"

# /app/migrate -path /app/db/migration -database "$DB_SOURCE" -verbose up

echo "start the app"
exec "$@"

# read