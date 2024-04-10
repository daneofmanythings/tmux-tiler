#!/usr/bin/env bash

function swap_main_pane() {
  tmux swap-pane -s 0 -t 1
}

function num_panes() {
  "$CURRENT_DIR"/scripts/num_panes.sh
}


function open_pane() {
  if [ "$(num_panes)" -gt 1 ]; then
    echo gt
  else
    echo lt
  fi
}

main() {
  open_pane
}

main
