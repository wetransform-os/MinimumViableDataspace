#!/bin/bash

#
# Using as consumer: company2
# 
# URLs provided in payload are so company2 can access them itself
#

curl -H 'X-Api-Key: ApiKeyDefaultValue' \
     -H 'Content-Type: application/json' \
     -d '{
   "edctype": "dataspaceconnector:dataplaneinstance",
   "id": "http-pull-provider-dataplane",
   "url": "http://company2:10101/api/v1/control/transfer",
   "allowedSourceTypes": [ "HttpData" ],
   "allowedDestTypes": [ "HttpProxy", "HttpData" ],
   "properties": {
     "publicApiUrl": "http://company2:8185/api/v1/public/"
   }
 }' \
     -X POST "http://localhost:9192/api/v1/data/instances"
