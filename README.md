# UNDERTMUX

**Undertmux** is a custom `tmux` configuration inspired by the Undertale game UI.  

![undertmux](undertmux.png)

Displayed values:

- Session name
- `LV` uptime hours
- `HP` battery lifetime
- Windows
- Date & Time

---

## Instalation

```bash
git clone https://github.com/God4n/undertmux.git
cd undertmux
cp -r .tmux-scripts ~/.
```

copy the content of the `.tmux.conf` and `.zshrc` configuration files to avoid override your configurations.

---

## Extra

The undertmux configuration includes a shortcut to create the default windows (`Ctrl`+`b`  `Shift`+`u`). However the other option is to add the next function to your `.zshrc` or `.bashrc`.

```
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
```

This function starts tmux with the default windows for undertmux.
