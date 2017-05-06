#!/usr/bin/env bash


#curl -XGET \
#   --globoff \
#   -H "Content-type: application/json" \
#   'https://search-tjr-2dg3jlw6xq4q6v6grhhlnqkk3a.eu-west-2.es.amazonaws.com/stock/widget/_search?pretty' \
#   -d'{
#    "aggs": {
#        "widgets": {
#            "terms": {
#                "field" : "event"
#                }
#            }
#         }
#     }'
#


#curl -XGET \
#  -H "Content-type: application/json" \
#  'https://search-tjr-2dg3jlw6xq4q6v6grhhlnqkk3a.eu-west-2.es.amazonaws.com/stock/widget/_search?pretty' \
#-d '{
#  "query": {
#    "bool": {
#      "must": { "match_all": {} },
#      "filter": {
#        "range": {
#          "timestamp": {
#            "gte": 1178718746,
#            "lte": 1183989146
#          }
#        }
#      }
#    }
#  }
#}'

#curl -XGET \
#  -H "Content-type: application/json" \
#  'https://search-tjr-2dg3jlw6xq4q6v6grhhlnqkk3a.eu-west-2.es.amazonaws.com/stock/widget/_search?pretty&size=0' \
#-d '{
#    "aggs" : {
#        "widgets" : {
#            "filter" : { "term": { "event": "tjr.widget.discontinued" } },
#            "aggs" : {
#                "latest" : { "max" : { "field" : "timestamp" } },
#                "_source": {
#                            "includes": [ "event", "state", "colour", "urn" , "price"]
#               }
#            }
#        }
#    }
#}'


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



#curl -XGET \
# -H "Content-type: application/json" \
# 'https://search-tjr-2dg3jlw6xq4q6v6grhhlnqkk3a.eu-west-2.es.amazonaws.com/stock/widget/_search?pretty' \
#-d '{
#    "size": 0,
#    "aggs": {
#        "widgets": {
#            "terms": {
#                "field": "urn"
#            },
#            "aggs" : {
#                "latest" : {
#                    "max" : {"field" : "timestamp"}
#
#                }
#            }
#        }
#    }
#}'