#!/usr/bin/env bash
set -e

function docker_compose_in_env() {
    docker-compose $(for file in $(ls *.yml); do echo "-f ${file}"; done) $@
}