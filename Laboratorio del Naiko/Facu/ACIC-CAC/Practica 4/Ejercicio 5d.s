; 5) El siguiente programa multiplica por 2 los elementos de un arreglo llamado datos y genera un nuevo arreglo llamado
; 	res. Ejecutar el programa en el simulador winmips64 con la opción Delay Slot habilitada.
; a) ¿Qué efecto tiene habilitar la opción Delay Slot (salto retardado)?.
;		  Deshabilitado: 
;		CPI - 1.692
;		BT - 7
;		  Habilitado:
;		CPI - 1.492
;		BT - 0
;
; b) ¿Con qué fin se incluye la instrucción NOP? ¿Qué sucedería si no estuviera?.
;		  Se usa como instruccion elemental para la salida del Delay Slot, si la instruccion no estuviera, el programa
;		quedaria en bucle infinito.
;
; c) Tomar nota de la cantidad de ciclos, la cantidad de instrucciones y los CPI luego de ejecutar el programa.
;		  Ciclos - 88
;		  Instrucciones - 52
;		  CPI - 1492
;
; d) Modificar el programa para aprovechar el ‘Delay Slot’ ejecutando una instrucción útil. Simular y comparar número de
; 	ciclos, instrucciones y CPI obtenidos con los de la versión anterior.
;		  Deshabilitado:
;		Ciclos - 96 
;		CPI - 1.846
;		RAW - 17
;		BT - 7
;		  Habilitado:
;		Ciclos - 96 
;		CPI - 1.627
;		RAW - 17
;		BT - 0

.data
	cant: .word 8
	datos: .word 1, 2, 3, 4, 5, 6, 7, 8
	res: .word 0
.code
	ld r2, cant(r0) ; cargo en r2 la cantidad de elementos totales de la tabla
	dadd r1, r0, r0 ; Desplazamiento en tabla
	loop: daddi r2, r2, -1 ; actualizo la cantidad de elementos restantes
		dsll r3, r3, 1 ; Desplazo a la izquierda los bits 1 vez (multiplica por 2)
		ld r3, datos(r1) ; cargo en r3 tabla+Desplazamiento
		daddi r1, r1, 8 ; Actualizo el Desplazamiento de la tabla
		sd r3, res(r1) ; agrego a la nueva tabla el valor calculado
	bnez r2, loop
	nop
halt