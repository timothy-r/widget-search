#!/usr/bin/env bash

TERM=$1

curl -XGET \
 -H "Content-type: application/json" \
 'https://search-trodger-e3ixwysobh5q7tqbo3qv4kopqu.eu-west-2.es.amazonaws.com/stock/widget/_search?pretty' \
-d "{
    \"size\": 0,
    \"aggs\": {
        \"widgets\": {
            \"terms\": {
                \"field\": \"$TERM\"
            },
            \"aggs\" : {
                \"latest\" : {
                    \"max\" : {\"field\" : \"timestamp\"}

                }
            }
        }
    }
}"