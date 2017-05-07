#!/usr/bin/env bash

#!/usr/bin/env bash

DATA=$1

curl -XPOST \
    https://search-trodger-e3ixwysobh5q7tqbo3qv4kopqu.eu-west-2.es.amazonaws.com/_bulk --data-binary "@$DATA"