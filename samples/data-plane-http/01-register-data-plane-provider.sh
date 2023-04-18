#!/bin/bash

# https://github.com/eclipse-edc/Samples/blob/main/transfer/transfer-06-consumer-pull-http/README.md#1-register-data-plane-instance-for-provider
# 
# Register data plane instance for provider
# Before a consumer can start talking to a provider, it is necessary to register the data plane instance of a connector. This is done by sending a POST request to the management API of the provider connector. The request body should contain the data plane instance of the consumer connector.

# The registration of the provider data plane instance is done by sending a POST request to the management API of the connector.

#
# Using as provider: company1
# 
# URLs provided in payload are so company1 can access them itself
#

curl -H 'X-Api-Key: ApiKeyDefaultValue' \
     -H 'Content-Type: application/json' \
     -d '{
   "edctype": "dataspaceconnector:dataplaneinstance",
   "id": "http-pull-provider-dataplane",
   "url": "http://company1:10101/api/v1/control/transfer",
   "allowedSourceTypes": [ "HttpData" ],
   "allowedDestTypes": [ "HttpProxy", "HttpData" ],
   "properties": {
     "publicApiUrl": "http://company1:8185/api/v1/public/"
   }
 }' \
     -X POST "http://localhost:9191/api/v1/data/instances"
