#!/bin/bash

battery_path=$(find /sys/class/power_supply/ -maxdepth 1 -type d -name "BAT*" | head -n1)

if [ -n "$battery_path" ] && [ -f "$battery_path/capacity" ]; then
  percent=$(cat "$battery_path/capacity")
  hp=$(((percent * 20) / 100))
  echo "$hp / 20"
else
  echo "-- / 20"
fi
