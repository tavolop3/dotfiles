#!/bin/bash

# Verifica si el micrófono está encendido (captura activa)
if amixer sget Capture toggle | grep -q '\[on\]'; then
    echo "<span color='#00FF00'> </span>"
else
    echo "<span color='#888888'> </span>"
fi

