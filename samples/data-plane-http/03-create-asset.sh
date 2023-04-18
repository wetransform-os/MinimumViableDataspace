#!/bin/bash

# The provider connector needs to transfer a file to the location specified by the consumer connector when the data are requested. In order to offer any data, the provider must maintain an internal list of resources offered, through a contract offer, the so-called "catalog".

# The following request creates an asset on the provider connector.
# 
# Note: Properties on proxying path, query params etc. were found in HttpDataAccess class,
# used by BaseSourceHttpParamsDecorator

curl -d '{
           "asset": {
             "properties": {
               "asset:prop:id": "assetId",
               "asset:prop:name": "product description",
               "asset:prop:contenttype": "application/json"
             }
           },
           "dataAddress": {
             "properties": {
               "name": "Test asset",
               "baseUrl": "http://mocks:3100/api/download",
               "type": "HttpData",
               "proxyBody": "true",
               "proxyPath": "true",
               "proxyQueryParams": "true",
               "proxyMethod": "true"
             }
           }
         }' -H 'content-type: application/json' -H 'X-Api-Key: ApiKeyDefaultValue' http://localhost:9191/api/v1/data/assets \
         -s | jq
