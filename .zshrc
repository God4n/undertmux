# CUSTOM FUNCTIONS
#
function undertmux {
  if tmux has-session -t UNDERTMUX 2>/dev/null; then
    tmux attach -t UNDERTMUX
  else
    tmux new-session -d -s UNDERTMUX -n "󰓥 FIGHT"
    tmux new-window -t UNDERTMUX: -n "󰘊 ACT"
    tmux new-window -t UNDERTMUX: -n " ITEM"
    tmux new-window -t UNDERTMUX: -n " MERCY"
    tmux select-window -t UNDERTMUX:1
    tmux attach -t UNDERTMUX
  fi
}
