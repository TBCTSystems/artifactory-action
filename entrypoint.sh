#!/bin/bash

set -e

echo "Authentication using API Key"

echo "jfrog rt c action-server --interactive=false --basic-auth-only=true --url=$INPUT_URL --apikey=$INPUT_APIKEY"
jfrog rt c action-server \
  --interactive=false \
  --basic-auth-only=true \
  --url=$INPUT_URL \
  --apikey=$INPUT_APIKEY

echo "jfrog rt use action-server"
jfrog rt use action-server

# Set working directory if specified
if [ $INPUT_WORKING_DIRECTORY != '.' ]; then
  cd $INPUT_WORKING_DIRECTORY
fi

commands=()
commands[0]=${INPUT_CMD0}
commands[1]=${INPUT_CMD1}
commands[2]=${INPUT_CMD2}
commands[3]=${INPUT_CMD3}
commands[4]=${INPUT_CMD4}
commands[5]=${INPUT_CMD5}
commands[6]=${INPUT_CMD6}
commands[7]=${INPUT_CMD7}
commands[8]=${INPUT_CMD8}
commands[9]=${INPUT_CMD9}
commands[10]=${INPUT_CMD10}
commands[11]=${INPUT_CMD11}
commands[12]=${INPUT_CMD12}
commands[13]=${INPUT_CMD13}
commands[14]=${INPUT_CMD14}
commands[15]=${INPUT_CMD15}
commands[16]=${INPUT_CMD16}
commands[17]=${INPUT_CMD17}
commands[18]=${INPUT_CMD18}
commands[19]=${INPUT_CMD19}
commands[20]=${INPUT_CMD20}

for ((i = 0; i < ${#commands[@]}; i++))
do
  cmd="${commands[$i]}"
  if [ ! -z "${cmd}" ]; then
    echo "Running: jfrog rt $cmd"
    sh -c "jfrog rt $cmd"
  fi
done
