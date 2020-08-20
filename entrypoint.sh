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

echo "GITHUB_WORKSPACE = ${GITHUB_WORKSPACE}"
echo "INPUT_WORKING_DIRECTORY = ${INPUT_WORKING_DIRECTORY}"

# Set working directory if specified
if [ $INPUT_WORKING_DIRECTORY != '.' ]; then
  cd $INPUT_WORKING_DIRECTORY
fi

echo "starting pwd"
pwd
echo "starting ls -l"
ls -l

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

for ((i = 0; i < ${#commands[@]}; i++))
do
  cmd="${commands[$i]}"
  if [ ! -z "${cmd}" ]; then
    echo "Running: jfrog rt $cmd"
    sh -c "jfrog rt $cmd"
  fi
done

echo "ending pwd"
pwd
echo "ending ls -l"
ls -l
echo "ending ls -l linux-os/"
ls -l linux-os/
