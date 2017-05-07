#!/usr/bin/env bash

. ./../.es-env

DATA=$1

curl -XPOST \
  "$HOST/$INDEX/$TYPE/_bulk" \
  --data-binary "@$DATA"