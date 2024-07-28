#!/bin/bash
#  AQUI SE LEE EL LA ENTRADA DEL NOMBRE DEL USUARIO
read -p "Ingrese su nombre de usuario de GitHub: " GITHUB_USER

# AQUI CONSULTAMOS A INTERNET EL JSON
API_URL="https://api.github.com/users/$GITHUB_USER"
JSON_RESPONSE=$(curl -s $API_URL)

#MODULO PARA PARTIR EL JSON POR DATOS USABLES
github_user=$(echo $JSON_RESPONSE | jq -r '.login')
id=$(echo $JSON_RESPONSE | jq -r '.id')
created_at=$(echo $JSON_RESPONSE | jq -r '.created_at')

# SE IMPRIME EN PANTALLA EL USUARIO Y TEXTO SOLICITADO
echo "Hola $github_user. User ID: $id. Cuenta fue creada el: $created_at."

# SEPARAMOS LA FECHA ACTUAL Y CREAMOS RUTA
fecha=$(date +"%Y-%m-%d")
log_dir="/tmp/$fecha"
log_file="$log_dir/saludos.log"

#SE CREA EL ARCHIVO EN EL DIRECTORIO
mkdir -p $log_dir

# SE SETE AL DIRECTORIO CREADO
echo "Hola $github_user. User ID: $id. Cuenta fue creada el: $created_at." >> $log_file

# IMPRIMOS LA FINALIZACION DE LA TAREA
echo "Tareas completadas. Se ha creado un archivo de registro en: $log_file"