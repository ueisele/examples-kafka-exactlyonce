#!/usr/bin/env bash
set -e
cd $(readlink -f $(dirname $0))

function main () {
    log
    start_service "zookeeper"
    start_service "kafka"
    start_service "schema-registry"
}

function log() {
    echo "Starting Infrastructure..."
}

function start_service () {
    docker-compose -f docker-compose-infra.yml up -d "${1:?'Specify a service to start'}"
}

main "$@"