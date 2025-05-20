; Ejercicio Fowarding, hecho por el profe
; 2) El siguiente programa intercambia el contenido de dos palabras de la memoria de datos, etiquetadas A y B.

; a) Ejecutarlo en el simulador con la opción Configure/Enable Forwarding deshabilitada. Analizar paso a paso su
; funcionamiento, examinar las distintas ventanas que se muestran en el simulador y responder:
; - ¿Qué instrucción está generando atascos (stalls) en el cauce (ó pipeline) y por qué? se esta atascando a estapa de if
; - ¿Qué tipo de ‘stall’ es el que aparece?
; - ¿Cuál es el promedio de Ciclos Por Instrucción (CPI) en la ejecución de este programa bajo esta configuración?

; b) Una forma de solucionar los atascos por dependencia de datos es utilizando el Adelantamiento de Operandos o Forwarding.
; Ejecutar nuevamente el programa anterior con la opción Enable Forwarding habilitada y responder:
; - ¿Por qué no se presenta ningún atasco en este caso? Explicar la mejora.
; - ¿Qué indica el color de los registros en la ventana Register durante la ejecución?
; - ¿Cuál es el promedio de Ciclos Por Instrucción (CPI) en este caso? Comparar con el anterior.

.data
A: .word 1
B: .word 2

.code
ld r1, A(r0)
ld r2, B(r0)
sd r2, A(r0)
sd r1, B(r0)
halt
