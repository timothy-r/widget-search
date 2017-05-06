#!/usr/bin/env bash

# get all widgets with urn = urn:tjr:widget.135

curl -XGET \
  -H "Content-type: application/json" \
  'https://search-tjr-2dg3jlw6xq4q6v6grhhlnqkk3a.eu-west-2.es.amazonaws.com/stock/widget/_search?pretty' \
-d '{
  "query": {
    "bool": {
      "must": {
        "match": {
            "urn": "urn:tjr:widget.135"
          }
        }
     }
   },
   "sort" : [
      {"timestamp" : {"order" : "desc"}}
   ]
}'