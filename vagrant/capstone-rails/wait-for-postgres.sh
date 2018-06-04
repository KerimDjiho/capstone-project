#!/bin/bash

set -e

exit="$@"

echo $DB_PASSWORD

until PGPASSWORD=$DB_PASSWORD psql -h "$DB_HOST" -U "$DB_USER"; do
 echo "Waiting for Postgres..."
 sleep 10s
done

echo "Postgres up! Starting rails-app..."


exec $exit
