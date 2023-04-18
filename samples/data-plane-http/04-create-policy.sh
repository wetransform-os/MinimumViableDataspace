#!/bin/bash

# In order to manage the accessibility rules of an asset, it is essential to create a policy. However, to keep things simple, we will choose a policy that gives direct access to all the assets that are associated within the contract definitions. This means that the consumer connector can request any asset from the provider connector.

curl -d '{
           "id": "aPolicy",
           "policy": {
             "uid": "231802-bb34-11ec-8422-0242ac120002",
             "permissions": [
               {
                 "target": "assetId",
                 "action": {
                   "type": "USE"
                 },
                 "edctype": "dataspaceconnector:permission"
               }
             ],
             "@type": {
               "@policytype": "set"
             }
           }
         }' -H 'content-type: application/json' -H 'X-Api-Key: ApiKeyDefaultValue' http://localhost:9191/api/v1/data/policydefinitions \
         -s | jq
