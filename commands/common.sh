#!/usr/bin/env bash

HOST=${ELASTICSEARCH_PORT_9200_TCP_ADDR-${ELASTICSEARCH_HOST-localhost}}
PORT=${ELASTICSEARCH_PORT_9200_TCP_PORT-${ELASTICSEARCH_PORT-9200}}

GZIP="gzip --fast"

function wait_elasticsearch {
    # Wait for Elasticsearch to be available
    TIMEOUT=${3:-30}
    echo -n "Waiting to connect to Elasticsearch at ${1-$HOST}:${2-$PORT}"
    for (( i=0;; i++ )); do
        if [ ${i} -eq ${TIMEOUT} ]; then
            echo " timeout!"
            exit 99
        fi
        sleep 1
        (exec 3<>/dev/tcp/${1-$HOST}/${2-$PORT}) &>/dev/null && break
        echo -n "."
    done
    echo " connected."
    exec 3>&-
    exec 3<&-
}


function genpasswd() {
    export LC_CTYPE=C  # Quiet tr warnings
    local l=$1
    [ "$l" == "" ] && l=16
    set +o pipefail
    strings < /dev/urandom | tr -dc A-Za-z0-9_ | head -c ${l}
    set -o pipefail
}
