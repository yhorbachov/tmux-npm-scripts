#!/usr/bin/env bash

INPUT=$(cat package.json | jq -r '.scripts | keys[]')

args=(
	-p "50%,50%" \
)

SCRIPT_NAME=$(echo -e "${INPUT// /}" | fzf-tmux "${args[@]}")

target=$(echo "$SCRIPT_NAME" | tr -d '\n')
if [[ -z "$target" ]]; then
	exit 0
fi

npm run $target
