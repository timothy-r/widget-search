#!/usr/bin/env bash

DATA=$1

curl -XPUT https://search-trodger-e3ixwysobh5q7tqbo3qv4kopqu.eu-west-2.es.amazonaws.com/stock/widget/1234 -d "@$DATA"