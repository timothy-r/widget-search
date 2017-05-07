#!/usr/bin/env bash

# get all widgets with URN in order

URN=$1

# use history.json template

DATA=`sed "s/__URN__/$URN/" history.json`

curl -XGET \
  -H "Content-type: application/json" \
  'https://search-trodger-e3ixwysobh5q7tqbo3qv4kopqu.eu-west-2.es.amazonaws.com/stock/widget/_search?pretty' \
  --data-binary "$DATA"