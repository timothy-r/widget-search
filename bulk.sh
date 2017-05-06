#!/usr/bin/env bash

#!/usr/bin/env bash

DATA=$1

curl -XPOST \
    https://search-tjr-2dg3jlw6xq4q6v6grhhlnqkk3a.eu-west-2.es.amazonaws.com/_bulk --data-binary "@$DATA"