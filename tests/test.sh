#!/usr/bin/env bash

set -e

[ "$DEBUG" == 'true' ] && set -x

CWD="$(dirname $0)/"

. ${CWD}functions.sh

echo "=> Test backup command"
docker run -d --name elasticsearch -p 9200:9200 -v /tmp/backup:/backup elasticsearch:latest -Epath.repo=/backup > /dev/null
sleep 10
docker run -t -i --name $TEST_NAME -e REPOSITORY_LOCATION=/backup -v /tmp/backup:/backup --link elasticsearch $TEST_CONTAINER backup
cleanup elasticsearch $TEST_NAME
