#!/bin/bash

if [ ! -z "$TAIGA_BROKER_URL" ]; then
  echo "Setting url in config.json..."
  sed -i "s/url\": \".*\"/url\": \"$(echo $TAIGA_BROKER_URL | sed -e 's/[\/&]/\\&/g')\"/g" /taiga-events/config.json
fi

if [ ! -z "$TAIGA_SECRET_KEY" ]; then
  echo "Setting secret in config.json..."
  sed -i "s/secret\": \".*\"/secret\": \"$(echo $TAIGA_SECRET_KEY | sed -e 's/[\/&]/\\&/g')\"/g" /taiga-events/config.json
fi

echo "Starting taiga-events..."
exec "$@"
