#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://stg-api.stackbit.com/project/5fcd7db32db6c70015ecf530/webhook/build/pull > /dev/null
curl -s -X POST https://stg-api.stackbit.com/project/5fcd7db32db6c70015ecf530/webhook/build/ssgbuild > /dev/null
cd exampleSite && hugo --gc --baseURL "/" --themesDir ../.. && cd ..
curl -s -X POST https://stg-api.stackbit.com/project/5fcd7db32db6c70015ecf530/webhook/build/publish > /dev/null
