; 1) Simular el siguiente programa de suma de números en punto flotante y analizar minuciosamente
;	la ejecución paso a paso. Inhabilitar Delay Slot y mantener habilitado Forwarding.
; a) Tomar nota de la cantidad de ciclos, instrucciones y CPI luego de la ejecución del programa.
;	CICLOS : 16
;	INSTRUCCIONES : 7
;	CPI : 2.286
;
; b) ¿Cuántos atascos por dependencia de datos se generan? Observar en cada caso cuál es el dato
;	en conflicto y las instrucciones involucradas.
; 	4 RAWs, 2 por el calculo y lectura de la instruccion "add.d f3, f2, f1" y guardado de f3
;	y 2 por la instruccion "mul.d f4, f2, f1" y el guardado de f4.
;
; c) ¿Por qué se producen los atascos estructurales? Observar cuales son las instrucciones que
;	los generan y en qué etapas del pipeline aparecen.
;
; d) Modificar el programa agregando la instrucción mul.d f1, f2, f1 entre las instrucciones add.d y mul.d.
; 
; Repetir la ejecución y observar los resultados. ¿Por qué aparece un atasco tipo WAR?
; e) Explicar por qué colocando un NOP antes de la suma, se soluciona el RAW de la instrucción
;	ADD y como consecuencia se elimina el WAR.


.data
	n1: .double 9.13
	n2: .double 6.58
	res1: .double 0.0
	res2: .double 0.0
.code
	l.d f1, n1(r0)
	l.d f2, n2(r0)
	add.d f3, f2, f1
	mul.d f4, f2, f1
	s.d f3, res1(r0)
	s.d f4, res2(r0)
halt