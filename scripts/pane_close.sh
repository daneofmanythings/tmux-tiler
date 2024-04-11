#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR"/apply_layout.sh

function close_pane() {
  local num_panes
  num_panes=$(tmux list-panes | wc -l)

  local main_pane_index=$(( "${num_panes}" - 1 ))

  local current_pane
  current_pane=$(tmux display-message -p '#{pane_index}')

  if [ "${current_pane}" == "${main_pane_index}" ] && [ "${num_panes}" == 2 ]; then
    tmux rotate-window -D
    current_pane=$(( "$current_pane" - 1 ))
  fi

  tmux kill-pane -t "${current_pane}"
  apply_layout_deleted_pane $(( "${num_panes}" - 1 ))
}

main() {
  close_pane
}

main
