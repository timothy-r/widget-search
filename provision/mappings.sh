#!/usr/bin/env bash

. ./../.es-env

curl -XPUT \
  -H "Content-type: application/json" \
  "$HOST/$INDEX?pretty" \
  --data-binary "@mappings.json"