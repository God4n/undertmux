#!/bin/sh

stty -echo -icanon time 0 min 0
tput civis

# Color rojo #e81324 en ANSI (approx)
RED="\033[38;2;232;19;36m"
RESET="\033[0m"
HEART="$RED$RESET"

get_size() {
  cols=$(tput cols)
  rows=$(tput lines)
}

get_size
x=$((cols / 2))
y=$((rows / 2))

draw() {
  tput clear
  tput cup "$y" "$x"
  printf "$HEART"
}

while :; do
  get_size
  draw
  read -rsn1 key
  if [ "$key" = $'\e' ]; then
    read -rsn2 key
    case "$key" in
    '[A') [ "$y" -gt 0 ] && y=$((y - 1)) ;;
    '[B') [ "$y" -lt $((rows - 1)) ] && y=$((y + 1)) ;;
    '[C') [ "$x" -lt $((cols - 2)) ] && x=$((x + 1)) ;;
    '[D') [ "$x" -gt 0 ] && x=$((x - 1)) ;;
    esac
  elif [ "$key" = "q" ]; then
    break
  fi
  sleep 0.01
done

tput cnorm
stty sane
clear
