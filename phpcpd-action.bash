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

if [ -n "$ACTION_MINLINES" ]
then
	command_string+=(--min-lines "$ACTION_MINLINES")
fi

if [ -n "$ACTION_MINTOKENS" ]
then
	command_string+=(--min-tokens "$ACTION_MINTOKENS")
fi

docker run --rm \
	--volume "${GITHUB_WORKSPACE}":/app \
	--workdir /app \
	--network host \
	jchellem/php-dev:main-8.1-cli "${command_string[@]}" && echo "PHPCPD completed successfully"
