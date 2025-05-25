#!/bin/bash

session=$(tmux display-message -p '#S')
current_index=$(tmux display-message -p '#I')
current_name=$(tmux display-message -p '#W')

name_no_icon=$(echo "$current_name" | sed 's/^[^ ]* //; s/^ //; s/^#[^]]*]//g')

heart="#[fg=#e81324]"

tmux rename-window -t "$session:$current_index" "$heart #[fg=#f9ff4c,bg=black,bold]$name_no_icon"

tmux list-windows -t "$session" -F "#{window_index}:#{window_name}" | while IFS=: read -r idx win; do
  if [ "$idx" != "$current_index" ]; then
    name_no_icon=$(echo "$win" | sed 's/^[^ ]* //; s/^ //; s/^#[^]]*]//g')
    icon=$(~/.tmux-scripts/undertmux-iconmap.sh "$name_no_icon")
    tmux rename-window -t "$session:$idx" "$icon"
  fi
done
