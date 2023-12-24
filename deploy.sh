#! /bin/bash

apt install jq
cat version.json
COMMIT_ID=$(cat version.json | jq -r '.commitId')
echo $COMMIT_ID
INVALIDATION_JSON="{ \"DistributionId\": \"E2VN6ABMEOQ0CQ\",\"InvalidationBatch\": {\"Paths\": {\"Quantity\": 1,\"Items\": [ \"/*\"]},\"CallerReference\": \"$COMMIT_ID\"}}"
echo $INVALIDATION_JSON
aws cloudfront create-invalidation --cli-input-json "$INVALIDATION_JSON"