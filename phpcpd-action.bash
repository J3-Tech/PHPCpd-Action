#!/bin/bash
set -e

command_string=("phpcpd")

if [ -n "$ACTION_PATH" ]
then
	command_string+=("$ACTION_PATH")
fi

if [ -n "$ACTION_EXCLUDE" ]
then
	command_string+=(--exclude "$ACTION_EXCLUDE")
fi

docker run --rm \
	--volume "${GITHUB_WORKSPACE}":/app \
	--workdir /app \
	--network host \
	jchellem/php-dev:main-8.1-cli "${command_string[@]}" && echo "PHPCPD completed successfully"
