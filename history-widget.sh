#!/usr/bin/env bash

. ./.es-env

# get all widgets with URN in order

URN=$1

# use history.json template

DATA=`sed "s/__URN__/$URN/" templates/history.json`

curl -XGET \
  -H "Content-type: application/json" \
  "$INDEX/_search?pretty" \
  --data-binary "$DATA"