#!/bin/bash

# Obtener uptime en formato legible
uptime_string=$(uptime -p) # Ej: "up 1 hour, 35 minutes" o "up 2 days, 4 hours"

# Extraer horas
hours=$(echo "$uptime_string" | grep -oP '\d+(?= hour)' | head -n 1)

# Si no hay horas, es 0
hours=${hours:-0}

# LV es horas + 1
lv=$((hours + 1))

echo "$lv"
