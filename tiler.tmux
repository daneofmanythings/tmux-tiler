#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/variables.sh"
source "$CURRENT_DIR/scripts/helpers.sh"

function set_open_key_bindings() {
  local key_bindings
  key_bindings=$(get_tmux_option "$open_pane_option" "$default_open_pane")

  local key
  for key in $key_bindings; do
    tmux bind-key -n "$key" run-shell "$CURRENT_DIR/scripts/pane_open.sh"
  done
}

function set_close_key_bindings() {
  local key_bindings
  key_bindings=$(get_tmux_option "$close_pane_option" "$default_close_pane")

  local key
  for key in $key_bindings; do
    tmux bind-key -n "$key" run-shell "$CURRENT_DIR/scripts/pane_close.sh"
  done
}

function set_default_options() {
  tmux set-option -gq "$main_pain_width_option" "$default_main_pane_width"
}

function main() {
  set_open_key_bindings
  set_close_key_bindings
  set_default_options
}

main
