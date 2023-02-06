#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f tmp/pids/server.pid
mkdir -p tmp/sockets
mkdir -p tmp/pids

# DBコンテナが起動するまで待つ記述
until mysqladmin ping -h $DB_HOST -P 3306 -u root --silent; do
  echo "waiting for mysql..."
  sleep 3s
done
echo "success to connect mysql"

# DB起動関連
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:migrate:status
bundle exec rails db:seed

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
