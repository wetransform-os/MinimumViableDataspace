#!/bin/bash

# To ensure an exchange between providers and consumers, the supplier must create a contract offer for the good, on the basis of which a contract agreement can be negotiated. The contract definition associates policies to a selection of assets to generate the contract offers that will be put in the catalog. In this case, the selection is empty, so every asset is attached to these policies

curl -d '{
           "id": "1",
           "accessPolicyId": "aPolicy",
           "contractPolicyId": "aPolicy",
           "criteria": []
         }' -H 'content-type: application/json' -H 'X-Api-Key: ApiKeyDefaultValue' http://localhost:9191/api/v1/data/contractdefinitions \
         -s | jq