#!/usr/bin/env bash

# get the latest widget state (group by urn, order by timestamp) for each widget

curl -XGET \
 -H "Content-type: application/json" \
 'https://search-trodger-e3ixwysobh5q7tqbo3qv4kopqu.eu-west-2.es.amazonaws.com/stock/widget/_search?pretty' \
-d '{
    "size": 0,

    "aggs": {

        "widgets": {
            "terms": {
                "field": "urn"
            },
            "aggs": {
                "latest_state": {
                    "top_hits": {
                        "sort": [
                            {
                                "timestamp": {
                                    "order": "asc"
                                }
                            }
                        ],
                        "_source": {
                            "includes": [ "event", "state", "colour", "urn" , "price", "timestamp", "city"]
                        },
                        "size":1
                    }
                }
            }
        }
    }
}'