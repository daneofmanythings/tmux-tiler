#!/usr/bin/env bash

# The '0' pane is held in the top left, and lower split panes are incremental from there,
# from which it follows that our 'main' pane (the large pane on the right) will be the last
# pane, making it $number_of_panes - 1.

source "$CURRENT_DIR"/helpers.sh
source "$CURRENT_DIR"/variables.sh

# Find the height of the main pane, then evenly set the hights of the sub panes.
function _default() {
  local primary_pane_num=$(("$1" - 1))

  local primary_pane_height
  primary_pane_height=$(tmux display-message -t "${primary_pane_num}" -p '#{pane_height}')

  local sub_pane_heights=$(("${primary_pane_height}" / "${primary_pane_num}"))

  for ((i = 0; i < primary_pane_num; i++)); do
    tmux resize-pane -t ${i} -y "${sub_pane_heights}"
  done
  
}

# Two steps:
# 1. adjust the size of the main window to match the setting
# 2. rotate the windows to get the main pane in the correct position
function _second_window_created() {
  local window_width
  window_width=$(tmux display -p '#{window_width}')

  local main_pane_width_compliment
  main_pane_width_compliment=$(( 100 - "$(get_tmux_option "$main_pane_width_option" "$default_main_pane_width")"))
  echo "${main_pane_width_compliment}"

  local new_sub_pane_height=$(( "$main_pane_width_compliment" * "$window_width" / 100 ))

  tmux resize-pane -t 0 -x "${new_sub_pane_height}"
  tmux rotate-window -D
}

# One step:
# 1. set pane width to window width
function _one_window_remaining() {
  local window_width
  window_width=$(tmux display -p '#{window_width}')

  tmux resize-pane -t 0 -x "${window_width}"
}

apply_layout_created_pane() {
  local num_panes=$1

  if [ "$num_panes" == 2 ]; then
    _second_window_created
  else
    _default "$num_panes"
  fi
}

apply_layout_deleted_pane() {
  local num_panes=$1

  if [ "$num_panes" == 1 ]; then
    _one_window_remaining
  else
    _default "$num_panes"
  fi
}
