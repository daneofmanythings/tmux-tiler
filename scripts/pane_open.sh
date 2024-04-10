#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR"/apply_layout.sh

function open_pane() {
  local num_panes=$(tmux list-panes | wc -l)
  if [ "${num_panes}" -gt 1 ]; then
    tmux select-pane -t 'bottom-left' \; split-pane
  else
    tmux split-window -h -p 75  
  fi

  apply_layout_created_pane $(("$num_panes" + 1))
}

main() {
  open_pane
}

main
