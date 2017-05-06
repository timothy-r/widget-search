#!/usr/bin/env bash

curl -XGET \
 -H "Content-type: application/json" \
 'https://search-tjr-2dg3jlw6xq4q6v6grhhlnqkk3a.eu-west-2.es.amazonaws.com/stock/widget/_search?pretty' \
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
                                    "order": "desc"
                                }
                            }
                        ],
                        "_source": {
                            "includes": [ "event", "state", "colour", "urn" , "price"]
                        },
                        "size":1
                    }
                }
            }
        }
    }
}'