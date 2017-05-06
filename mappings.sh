#!/usr/bin/env bash


curl -XPUT \
 -H "Content-type: application/json" \
 'https://search-tjr-2dg3jlw6xq4q6v6grhhlnqkk3a.eu-west-2.es.amazonaws.com/stock?pretty' \
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
        }
      }
    }
  }
}
'