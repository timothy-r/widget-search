#!/usr/bin/env bash

DATA=$1

curl -XPUT https://search-tjr-2dg3jlw6xq4q6v6grhhlnqkk3a.eu-west-2.es.amazonaws.com/stock/widget/1234 -d "@$DATA"