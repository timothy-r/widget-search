#!/usr/bin/env bash

. ./.es-env

# for a KEY VALUE pair group widgets by TERM

KEY=$1
VALUE=$2
TERM=$3

DATA=`sed "s/__KEY__/$KEY/; s/__VALUE__/$VALUE/; s/__TERM__/$TERM/" templates/bucket-filter.json`

curl -XGET \
  -H "Content-type: application/json" \
  "$HOST/$INDEX/$TYPE/_search?pretty" \
  --data-binary "$DATA"
