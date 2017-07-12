#!/usr/bin/env bash
set -e
cd $(dirname $0)
source ./defaults.sh

function docker-ips() {
    docker ps -f network="${PROJECT_NETWORK}" | while read line; do
        if `echo $line | grep -q 'CONTAINER ID'`; then
			printf "%-25s\t%-25s\n" 'Name' 'IP Address'
        else
            CID=$(echo $line | awk '{print $1}');
            NAME=$(docker inspect --format '{{ .Name }}' $CID);
            IP=$(docker inspect --format "{{ .NetworkSettings.Networks.${PROJECT_NETWORK}.IPAddress }}" $CID);
			printf "%-25s\t%-25s\n" ${NAME} ${IP}
        fi
    done;
}

docker-ips
