#!/bin/bash

# Verificar si el script se ejecuta como root
if [[ $EUID -ne 0 ]]; then
  echo "Este script debe ejecutarse con privilegios de superusuario (root)."
  exit 1
fi

# Ruta del archivo de configuración del teclado
KEYBOARD_CONFIG="/etc/default/keyboard"

# Crear una copia de seguridad del archivo original
if [[ ! -f "$KEYBOARD_CONFIG.bak" ]]; then
  cp "$KEYBOARD_CONFIG" "$KEYBOARD_CONFIG.bak"
  echo "Se ha creado una copia de seguridad de $KEYBOARD_CONFIG en $KEYBOARD_CONFIG.bak."
fi

# Modificar el archivo de configuración para establecer el teclado en español
sed -i 's/^XKBLAYOUT=.*/XKBLAYOUT="es"/' "$KEYBOARD_CONFIG"

# Aplicar los cambios inmediatamente
setxkbmap es

# Confirmar que se ha aplicado el cambio
echo "La distribución del teclado se ha cambiado a español."
