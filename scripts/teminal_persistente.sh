#!/bin/bash

# Verificar si ya hay una terminal abierta
if ! pgrep -x "kitty" > /dev/null; then
    # Si no hay una terminal abierta, ejecuta una nueva en segundo plano
    kitty --class "persistente-terminal" &>/dev/null &
fi

# Ahora, lanzar una nueva terminal "visible" cuando sea necesario
kitty --class "nueva-terminal" &>/dev/null &
