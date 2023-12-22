#! /bin/bash

apt install jq
COMMIT_ID=$(cat version.json | jq -r '.commitId')
echo $COMMIT_ID
aws cloudfront create-invalidation --distribution-id E2VN6ABMEOQ0CQ