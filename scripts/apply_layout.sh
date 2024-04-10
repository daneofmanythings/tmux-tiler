#!/usr/bin/env bash

# The '0' pane is held in the top left, and lower split panes are incremental from there,
# from which it follows that our 'main' pane (the large pane on the right) will be the last
# pane, making it $number_of_panes - 1.


# Find the height of the main pane, then evenly set the hights of the sub panes.
function _default() {
  local primary_pane_num=$(("$1" - 1))
  local primary_pane_height=$(tmux display-message -t "${primary_pane_num}" -p '#{pane_height}')
  local sub_pane_heights=$(("${primary_pane_height}" / "${primary_pane_num}"))

  for ((i = 0; i < primary_pane_num; i++)); do
    tmux resize-pane -t ${i} -y "${sub_pane_heights}"
  done
  
}

# The split happens on the wrong side, so we need to do a rotation to correct the positioning.
function _second_window_created() {
  tmux rotate-window -D
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
  echo not implemented
}
