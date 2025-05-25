#!/bin/bash

uptime_string=$(uptime -p) # Ej: "up 1 hour, 35 minutes" o "up 2 days, 4 hours"
hours=$(echo "$uptime_string" | grep -oP '\d+(?= hour)' | head -n 1)
hours=${hours:-0}
lv=$((hours + 1))
echo "$lv"
