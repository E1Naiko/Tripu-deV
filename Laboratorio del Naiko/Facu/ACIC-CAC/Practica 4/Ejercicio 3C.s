; 3) Analizar el siguiente programa con el simulador MIPS64:
; a) Ejecutar el programa con Forwarding habilitado y responder:
; - ¿Por qué se presentan atascos tipo RAW?
;		  Se presentan atascos del tipo RAW ya que se esta tratando de usar el valor de la variable B en el registro
;		r2, pero cuando esta se encuentra en estapa de ID
;
; - Branch Taken es otro tipo de atasco que aparece. ¿Qué significa? ¿Por qué se produce?
;		  r2 originalmente no esta cargado, con lo que se intenta comparar un valor que no existe para cortar el bucle
;		asi que no se corta el bucle y se genera una rotura de dezplazamiento
;		Segun el palu es el salto no tomado, desapruebenlo a el por favor se los pido, asi que no entra en el parcial, no?
;
; - ¿Cuántos CPI tiene la ejecución de este programa? Tomar nota del número de ciclos,
;	cantidad de instrucciones y CPI.
;		  2.048 CPI en 2da ejecucion.
;
; b) Ejecutar ahora el programa deshabilitando el Forwarding y responder:
; - ¿Qué instrucciones generan los atascos tipo RAW y por qué? ¿En qué etapa del cauce se produce el atasco en
;	cada caso y durante cuántos ciclos?
;		  Se produce un error RAW en la etapa de MEM ya que B no esta cargado en r2
;
; - Los Branch Taken Stalls se siguen generando. ¿Qué cantidad de ciclos dura este atasco en cada vuelta
;	del lazo ‘loop’? Comparar con la ejecución con Forwarding y explicar la diferencia.
;		  dura 5 ciclos vs 5 ciclos, no te arregla un carajo el Forwarding
;		  
; - ¿Cuántos CPI tiene la ejecución del programa en este caso? Comparar número de ciclos, cantidad de
;	instrucciones y CPI con el caso con Forwarding.
;		  CPI 1.667 vs 2.048, Atascos 6Raw-2BT-2BMp vs 13Raw-5BT-0BMP
;		  
; c) Reordenar las instrucciones para que la cantidad de RAW sea ‘0’ en la ejecución del programa
;	(Forwarding habilitado)
;
; d) Modificar el programa para que almacene en un arreglo en memoria de datos los contenidos parciales
;	del registro r1 ¿Qué significado tienen los elementos de la tabla que se genera?
;
.data
	A: .word 1
	B: .word 6
.code
	ld r2, B(r0)
	ld r1, A(r0)
	loop: daddi r2, r2, -1
	dsll r1, r1, 1
	bnez r2, loop
halt
