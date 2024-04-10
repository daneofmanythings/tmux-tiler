#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/variables.sh"
source "$CURRENT_DIR/scripts/helpers.sh"

function set_open_key_bindings() {
  local key_bindings=$(get_tmux_option "$open_pane_options" "$default_open_pane")
  local key
  for key in $key_bindings; do
    tmux bind-key -n "$key" run-shell "$CURRENT_DIR/scripts/pane_open.sh"
  done
}

function set_close_key_bindings() {
  local key_bindings=$(get_tmux_option "$close_pane_option" "$default_close_pane")
  local key
  for key in $key_bindings; do
    tmux bind-key -n "$key" run-shell "$CURRENT_DIR/scripts/pane_close.sh"
  done
}

function main() {
  set_open_key_bindings
  set_close_key_bindings
}

main
