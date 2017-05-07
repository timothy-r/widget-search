#!/usr/bin/env bash

. ./.es-env

# query using json from a file
FILE=$1

curl -XGET \
   -H "Content-type: application/json" \
   "$HOST/$INDEX/$TYPE/_search?pretty" \
   -d @$FILE