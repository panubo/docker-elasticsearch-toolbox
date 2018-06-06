#!/usr/bin/env bash

set -e

[ "$DEBUG" == 'true' ] && set -x

CWD="$(dirname $0)/"

. ${CWD}functions.sh

# Test setup
TMPDIR=$(make_temp)

echo "=> Test backup command"
docker run -d --name elasticsearch -p 9200:9200 -v ${TMPDIR}:/backup elasticsearch:latest -Epath.repo=/backup > /dev/null
sleep 5
docker run -t -i --name $TEST_NAME -e REPOSITORY_LOCATION=/backup -e RETENTION_COUNT=0 --link elasticsearch $TEST_CONTAINER backup
cleanup elasticsearch $TEST_NAME
