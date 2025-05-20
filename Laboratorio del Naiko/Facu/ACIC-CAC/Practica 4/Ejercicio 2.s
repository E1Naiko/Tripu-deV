; 2) El siguiente programa intercambia el contenido de dos palabras de la memoria de datos, etiquetadas A y B.
;
; a) Ejecutarlo en el simulador con la opción Configure/Enable Forwarding deshabilitada. Analizar paso a paso su
; funcionamiento, examinar las distintas ventanas que se muestran en el simulador y responder:
; - ¿Qué instrucción está generando atascos (stalls) en el cauce (ó pipeline) y por qué?
;		  sd r2, A(r0), ya que depende de que se cargue direccion de B para poder completarse,
;		la cual esta 2 ciclos mas atras
;
; - ¿Qué tipo de ‘stall’ es el que aparece?
;		  RAW (Read After Write)
;
; - ¿Cuál es el promedio de Ciclos Por Instrucción (CPI) en la ejecución de este programa bajo esta configuración?
;		  2.200
;
; b) Una forma de solucionar los atascos por dependencia de datos es utilizando el Adelantamiento de Operandos o Forwarding.
; Ejecutar nuevamente el programa anterior con la opción Enable Forwarding habilitada y responder:
;
; - ¿Por qué no se presenta ningún atasco en este caso? Explicar la mejora.
;		  La configuracion de fowarding permite guardar en registro los valores de A y B en la etapa de memoria,
;		lo que soluciona los errores RAW, pero ingrementa el CPI ya que esta cargando datos en 2 registros por dato
;
; - ¿Qué indica el color de los registros en la ventana Register durante la ejecución?
;		  El color indica que se cargaron datos en dichos registros.
;		  
; - ¿Cuál es el promedio de Ciclos Por Instrucción (CPI) en este caso? Comparar con el anterior.
;		  5.000, mas del doble
;

.data
	A: .word 1
	B: .word 3
.code
	ld r1, A(r0)
	ld r2, B(r0)
	sd r2, A(r0)
	sd r1, B(r0)
halt