#!/bin/bash

#
# Usage:
# Optional argument to add to API request
#

# Extract information sent to mock upload endpoint
LAST_LOG_LINE=$(docker logs mvds-mock-upload | tail -1)
# Strip "Request Body: " (14 characters)
JSON=$(echo "$LAST_LOG_LINE" | sed 's/^.\{14\}//')

ENDPOINT=$(echo "$JSON" | jq -r .endpoint)
AUTH_CODE=$(echo "$JSON" | jq -r .authCode)

# replace internal port by mapped port for company2
ENDPOINT=$(echo "$ENDPOINT" | sed 's/8185/8192/')
ENDPOINT=$(echo "$ENDPOINT" | sed 's/company2/localhost/')

COMMAND="curl \
  --header 'Authorization: $AUTH_CODE' \
  --location --request GET '$ENDPOINT$1'"

echo "[Attempting to run]"
echo "$COMMAND"
echo ""

echo "[Response]"
eval $COMMAND

echo ""
echo ""

echo "[Request made in provider (log)]"
docker logs company1 | grep mocks | tail -1

echo ""

# echo ""
# echo "[Modifying request]"
# COMMAND="curl \
#   --header 'Authorization: $AUTH_CODE' \
#   --location --request GET '${ENDPOINT}subpath?param=test'"
# echo "$COMMAND"
# echo ""
#
# echo "[Response]"
# eval $COMMAND
# echo ""
# echo ""

# echo "[Request made in provider (log)]"
# docker logs company1 | grep mocks | tail -1
