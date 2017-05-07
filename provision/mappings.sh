#!/usr/bin/env bash


curl -XPUT \
 -H "Content-type: application/json" \
 'https://search-trodger-e3ixwysobh5q7tqbo3qv4kopqu.eu-west-2.es.amazonaws.com/stock?pretty' \
-d '{
  "mappings": {
    "widget": {
      "properties": {
        "urn": {
          "type": "keyword",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "type": {
          "type": "keyword",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "colour": {
          "type": "keyword",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "event": {
          "type": "keyword",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "state": {
          "type": "keyword",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "city": {
          "type": "keyword",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "timestamp": {
          "type": "integer"
          }
        }
      }
    }
  }
}
'