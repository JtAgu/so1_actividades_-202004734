Universidad de San Carlos de Guatemala

Facultad de Ingeniería

Escuela de Ciencias y Sistemas

Sistemas Operativos 1

Segundo Semestre 2024

### Justin Josue Aguirre Roman      - 202004734

<center>

# ACTIVIDAD #03

</center>

Para la actividad 3 se tiene el siguiente script de resolucion para cada uno de los puntos


#  Parte 1: Gestión de Usuarios
## 1. **Creación de Usuarios:** Crea tres usuarios llamados `usuario1`, `usuario2` y `usuario3`.

    #!/bin/bash
    # Creación de usuarios 1, 2 y 3
    sudo useradd usuario1 -m
    sudo useradd usuario2 -m
    sudo useradd usuario3 -m


## 2. **Asignación de Contraseñas:** Establece una nueva contraseñas para cada usuario creado.
Se solicita el cambio de contraseña de cada uno de los uaurios y se hace ingreso dos veces para confirmación del sistema.

    # Cambio de contraseña de cada uno de los usuarios
    sudo passwd usuario1
    Pswd.usuario1
    Pswd.usuario1
    sudo passwd usuario2
    Pswd.usuario2
    Pswd.usuario2
    sudo passwd usuario3
    Pswd.usuario3
    Pswd.usuario3

## 3. **Información de Usuarios:** Muestra la información de `usuario1` usando el comando `id`.

    userdel usuario1
    >uid=1001(usuario1) gid=1001(usuario1) groups=1001(usuario1)

## 4. **Eliminación de Usuarios:** Elimina `usuario3`, pero conserva su directorio principal.
Si queremos remover un usuario de nuestro sistema solamente debemos ingresar el comando 'userdel usuario1', para eliminarlo junto con el directorio de usuario se debe añadir el flag '-r'. En este caso no se debe de añadir.

    sudo userdel usuario3


#  Parte 2: Gestión de Usuarios

## **1. Creación de Grupos:** Crea dos grupos llamados `grupo1` y `grupo2`.
    # Creación de Grupos
    sudo groupadd grupo1
    sudo groupadd grupo2


## **2. Agregar Usuarios a Grupos:** Agrega `usuario1` a `grupo1` y `usuario2` a `grupo2`.

    sudo usermod -aG grupo1 usuario1
    sudo usermod -aG grupo2 usuario2

## **3. Verificar Membresía:** Verifica que los usuarios han sido agregados a los grupos utilizando el comando `groups`.

    groups usuario1
    >usuario1 : usuario1 grupo1

## **4. Eliminar Grupo:** Elimina `grupo2`.

    sudo groupdel grupo2

# Parte 3: Gestión de Permisos
## **1.Creación de Archivos y Directorios:**
*    Como `usuario1`, crea un archivo llamado `archivo1.txt` en su directorio principal y escribe algo en él.
* Crea un directorio llamado `directorio1` y dentro de ese directorio, un archivo llamado `archivo2.txt`.

Para ambas consultas se tiene el siguiente script:

    sudo -u usuario1 bash << EOF
    echo "Este es el contenido de archivo1.txt" > /home/usuario1/archivo1.txt
    mkdir /home/usuario1/directorio1
    echo "Este es el contenido de archivo2.txt" > /home/usuario1/directorio1/archivo2.txt
    EOF

## **2.Verificar Permisos:** Verifica los permisos del archivo y directorio usando el comando `ls -l` y `ls -ld` respectivamente.

    cd ..
    sudo ls usuario1 -l
    > -rw-rw-r-- 1 usuario1 usuario1   37 Aug  4 02:52 archivo1.txt
    > drwxrwxr-x 2 usuario1 usuario1 4096 Aug  4 02:52 directorio1

## **3.Modificar Permisos usando `chmod` con Modo Numérico:** Cambia los permisos del `archivo1.txt` para que sólo `usuario1` pueda leer y escribir (permisos `rw-`), el grupo pueda leer (permisos `r--`) y nadie más pueda hacer nada.

    sudo chmod 640 /home/usuario1/archivo1.txt

## **4.Modificar Permisos usando `chmod` con Modo Simbólico:** Agrega permiso de ejecución al propietario del `archivo2.txt`.

    sudo chmod 640 /home/usuario1/archivo1.txt

## **5.Cambiar el Grupo Propietario:** Cambia el grupo propietario de `archivo2.txt` a `grupo1`.

    sudo chown :grupo1 /home/usuario1/directorio1/archivo2.txt


## **6. Configurar Permisos de Directorio:** Cambia los permisos del `directorio1` para que sólo el propietario pueda entrar (permisos `rwx`), el grupo pueda listar contenidos pero no entrar (permisos `r--`), y otros no puedan hacer nada.

    sudo chmod 740 /home/usuario1/directorio1


## **7. Comprobación de Acceso:** Intenta acceder al `archivo1.txt` y `directorio1/archivo2.txt` como `usuario2`. Nota cómo el permiso de directorio afecta el acceso a los archivos dentro de él.

    sudo -u usuario2 cat /home/usuario1/archivo1.txt
    > cat: /home/usuario1/archivo1.txt: Permission denied

## **8. Verificación Final:** Verifica los permisos y propietario de los archivos y directorio nuevamente con `ls -l` y `ls -ld`.

     sudo ls usuario1 -l
    > -rw-r----- 1 usuario1 usuario1   37 Aug  4 02:52 archivo1.txt
    > drwxrwxr-x 2 usuario1 usuario1 4096 Aug  4 02:52 directorio1

     sudo ls usuario1 -ld
    > drwxr-x--- 3 usuario1 usuario1 4096 Aug  4 02:52 usuario1

    sudo ls usuario1/directorio1 -l
    > -rwxrw-r-- 1 usuario1 grupo1 37 Aug  4 02:52 archivo2.txt
     
    sudo ls usuario1/directorio1 -ld
    > drwxrwxr-x 2 usuario1 usuario1 4096 Aug  4 02:52 usuario1/directorio1