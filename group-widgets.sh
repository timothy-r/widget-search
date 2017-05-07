#!/usr/bin/env bash

. ./.es-env

# get all widgets with URN in order

TERM=$1

# use group.json template

DATA=`sed "s/__TERM__/$TERM/" templates/group.json`

curl -XGET \
  -H "Content-type: application/json" \
  "$HOST/$INDEX/$TYPE/_search?pretty" \
  --data-binary "$DATA"