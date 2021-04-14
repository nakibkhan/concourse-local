#!/usr/bin/env bash

set -e

declare programsToCheck=(
  "docker"
  "docker-compose"
  "fly"
  "jq"
)

function checkForPrograms() {
  for (( i=0; i<${#programsToCheck[@]}; i++ ));
  do
    if ! [ -x "$(command -v ${programsToCheck[$i]})" ]; then
      echo 'Error: ' ${programsToCheck[$i]} 'is not installed. Please install' ${programsToCheck[$i]}
      exit
    fi
  done
}

function dockerUp() {
  docker-compose up -d vault-server &&
  docker-compose up vault-cli &&
  export ROLE_ID=`jq -r '.data.role_id' ./vault/secrets/role.json` &&
  export SECRET_ID=`jq -r '.data.secret_id' ./vault/secrets/secret.json` &&
  docker-compose up concourse-db concourse-web concourse-worker
}

{
  checkForPrograms
  dockerUp || echo "An error has occured. Exiting ..." && exit
}