#!/usr/bin/env bash

pane_working_dir=$(tmux display-message -p '#{pane_current_path}')
cd "$pane_working_dir"

INPUT=$(cat package.json | jq -r '.scripts | keys[]')

args=(
	-p "50%,50%" \
)

SCRIPT_NAME=$(echo -e "${INPUT}" | fzf-tmux "${args[@]}")
tmux send-keys -t. "npm run $SCRIPT_NAME" Enter
