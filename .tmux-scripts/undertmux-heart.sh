#!/bin/bash

session=$(tmux display-message -p '#S')
current_index=$(tmux display-message -p '#I')
current_name=$(tmux display-message -p '#W')

# Sacar ícono o corazón
name_no_icon=$(echo "$current_name" | sed 's/^[^ ]* //; s/^ //; s/^#[^]]*]//g')

# Corazón rojo (sin cerrar el formato con #[default])
heart="#[fg=#e81324]"

# Renombrar actual con corazón + mantener formato
tmux rename-window -t "$session:$current_index" "$heart #[fg=#f9ff4c,bg=black,bold]$name_no_icon"

# Restaurar íconos en otras ventanas
tmux list-windows -t "$session" -F "#{window_index}:#{window_name}" | while IFS=: read -r idx win; do
  if [ "$idx" != "$current_index" ]; then
    name_no_icon=$(echo "$win" | sed 's/^[^ ]* //; s/^ //; s/^#[^]]*]//g')
    icon=$(~/.tmux-scripts/undertmux-iconmap.sh "$name_no_icon")
    tmux rename-window -t "$session:$idx" "$icon"
  fi
done
