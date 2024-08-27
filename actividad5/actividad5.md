Universidad de San Carlos de Guatemala

Facultad de Ingeniería

Escuela de Ciencias y Sistemas

Sistemas Operativos 1

Segundo Semestre 2024

### Justin Josue Aguirre Roman - 202004734

<center>

# ACTIVIDAD #05

</center>


#  Kernel
El kernel es un componente esencial en los sistemas operativos, funcionando como un intermediario entre el hardware y el software. Su principal función es gestionar recursos, proporcionar servicios y facilitar la interacción entre el usuario y el sistema. 
## Tipos de kernels

* **Kernel monolítico:** En este diseño, todas las funciones del kernel se implementan como un único programa en espacio de kernel. Ejemplos de sistemas operativos con kernels monolíticos son Linux y Windows (aunque Windows también incorpora aspectos de diseño híbrido). 

* **Microkernel:** En contraste con el enfoque monolítico, un microkernel delega la mayoría de las funciones del kernel a procesos separados que se ejecutan en espacio de usuario. Esto reduce la complejidad del núcleo y facilita la extensibilidad y la modularidad del sistema operativo. Ejemplos de sistemas con microkernels son GNU Hurd y QNX. 

* **Kernel híbrido:** Como su nombre sugiere, un kernel híbrido combina características de los kernels monolíticos y microkernels. Algunas funciones críticas se implementan en espacio de kernel, mientras que otras se ejecutan como procesos en espacio de usuario. Este enfoque busca combinar la eficiencia del kernel monolítico con la flexibilidad del microkernel. macOS es un ejemplo de sistema operativo que utiliza un kernel híbrido. 


## User Mode vs Kernel Mode

* **Kernel Mode**

**Descripción:** En este modo, el código tiene acceso completo a todo el hardware y puede ejecutar cualquier instrucción en la CPU. Este modo es usado por el núcleo del sistema operativo (kernel) y algunos controladores de dispositivo.

**Ventajas:** Permite al sistema operativo controlar todos los aspectos del hardware, lo que es crucial para la gestión de recursos y la seguridad.

**Desventajas:** Si ocurre un fallo en el modo kernel, puede comprometer la estabilidad del sistema entero.

* **User Mode**
 
**Descripción:** En este modo, las aplicaciones y algunos servicios del sistema operativo se ejecutan con privilegios limitados. No tienen acceso directo al hardware ni pueden ejecutar instrucciones críticas para el sistema.
 
**Ventajas:** Protege al sistema operativo y otros programas de errores en las aplicaciones de usuario, mejorando la estabilidad del sistema.

**Desventajas:** Menor flexibilidad para las aplicaciones, ya que deben solicitar servicios al kernel para acceder a recursos críticos.


## **Interruptions vs Traps**

**Interrupciones**

Descripción: Son señales enviadas por hardware o software al procesador para notificar que un evento necesita ser atendido. Las interrupciones permiten al procesador dejar temporalmente la ejecución de su tarea actual para responder al evento, y luego retomar la tarea donde la dejó.

Tipos:
Hardware Interruptions: Provocadas por dispositivos hardware, como un teclado o una tarjeta de red.
Software Interruptions: Provocadas por el software, como llamadas al sistema o excepciones.

**Traps**

Descripción: Una trampa es un tipo específico de interrupción que es generada por el procesador cuando una operación no permitida o una condición excepcional ocurre durante la ejecución de un programa. Las trampas se utilizan típicamente para manejar errores o para realizar llamadas al sistema.

Diferencia Clave: Mientras que las interrupciones suelen ser asíncronas (pueden ocurrir en cualquier momento), las trampas son sincrónicas, ya que ocurren como resultado directo de la ejecución de una instrucción específica.

Estas diferencias son fundamentales para la arquitectura de sistemas operativos y la forma en que los procesos interactúan con el hardware y el kernel.


## REFERENCIAS
[KERNEL - EDUCA OPEN](https://www.educaopen.com/digital-lab/metaterminos/k/kernel)
[Trap vs Interrupt in OS - EDUCBA](https://www.educba.com/trap-vs-interrupt-in-operating-system/)