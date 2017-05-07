#!/usr/bin/env bash

# query using json from a file
FILE=$1

curl -XGET \
   -H "Content-type: application/json" \
   'https://search-trodger-e3ixwysobh5q7tqbo3qv4kopqu.eu-west-2.es.amazonaws.com/stock/widget/_search?pretty' \
   -d @$FILE