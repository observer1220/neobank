#!/bin/sh

set -e

echo "Run db migration"
echo "DB_SOURCE: $DB_SOURCE"

# FTL cannot create new migrate instance error="pq: the database system is starting up"
# /app/migrate -path /app/migration -database "$DB_SOURCE" -verbose up

# FTL cannot create new migrate instance error="pq: password authentication failed for user \"root\""

echo "start the app"
exec "$@"
