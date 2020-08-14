#!/bin/sh

set -e

echo "Authentication using API Key"

sh -c "jfrog rt c action-server --interactive=false --url=$INPUT_URL --apikey=$INPUT_APIKEY"
sh -c "jfrog rt use action-server"

# Set working directory if specified
if [ $INPUT_WORKING_DIRECTORY != '.' ]; then
  cd $INPUT_WORKING_DIRECTORY
fi

# Log command for info
echo "[Info] jfrog rt $*"

for cmd in "$@"; do
  echo "Running: '$cmd'"
  if sh -c "jfrog rt $cmd"; then
    echo "Success!"
  else
    exit_code=$?
    echo "Failure: '$cmd' exited with $exit_code"
    exit $exit_code
  fi
done
