#!/bin/bash

# In order to offer any data, the consumer can fetch the catalog from the provider, that will contain all the contract offers available for negotiation. In our case, it will contain a single contract offer, the so-called "catalog". To get the catalog from the consumer side, you can use the following endpoint:

curl -X POST "http://localhost:9192/api/v1/data/catalog/request" \
--header 'Content-Type: application/json' \
-H 'X-Api-Key: ApiKeyDefaultValue' \
--data-raw '{
  "providerUrl": "http://company1:8282/api/v1/ids/data"
}'