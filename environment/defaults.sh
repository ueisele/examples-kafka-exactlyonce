#!/usr/bin/env bash
source ./.env

PROJECT_NAME="${COMPOSE_PROJECT_NAME}"
PROJECT_NETWORK="${COMPOSE_PROJECT_NAME}_default"
VERSION_APP=$(git describe --tags)
