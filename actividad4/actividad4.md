Universidad de San Carlos de Guatemala

Facultad de Ingeniería

Escuela de Ciencias y Sistemas

Sistemas Operativos 1

Segundo Semestre 2024

### Justin Josue Aguirre Roman      - 202004734

<center>

# **ACTIVIDAD #04**

</center>

Para la actividad 4 se detallan los pasos para la ejecucion de un Bash Script que imprima un saludo y la fecha actual infinitamente con una pausa de un segundo que a su vez se encuentre habilitado para que se inicie con el sistema:


## 1. Script Bash

    #!/bin/bash
    while true; do
        echo "Hola! La fecha actual es: $(date)"
        sleep 1
    done


## 2. Crear el archivo de servicio

    [Unit]
    Description=Servicio que imprime un saludo y la fecha actual infinitamente

    [Service]
    ExecStart=/ruta/completa/a/saludo.sh
    Restart=always

    [Install]
    WantedBy=multi-user.target


## 3. Recarga systemd para reconocer el nuevo servicio:

    sudo systemctl daemon-reload

## 4. Habilita el servicio para que se inicie al arrancar el sistema
    sudo systemctl enable saludo.service


## 5. Inicia el servicio
    sudo systemctl start saludo.service