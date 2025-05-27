; 4) Dado el siguiente programa:
; a) Ejecutar en simulador con Forwarding habilitado.
;	¿Qué tarea realiza?
;		  Compara si un valor en TODA la tabla = 7
;	¿Cuál es el resultado y dónde queda indicado?
;		  El resultado queda guardado en r10=$t2 y es 1 (verdadero)
;
; b) Re-Ejecutar el programa con la opción Configure/Enable Branch Target Buffer habilitada.
; 	Explicar la ventaja de usar este método y cómo trabaja.
;		    La configuracion Branch Target Buffer activa un buffer que guarda donde se produjo un error Branch Taken
;		lo que le permite a WINMIPS64 predecir el mismo error dentro de un bucle y asumir un resultado correcto hasta
;		hasta que se termine el bucle, en donde se producira el mismo error. La ventaja es que se reducen los errores
;		Branch Taken a la mitad, mejorando los CPI.
;		  
; c) Confeccionar una tabla que compare número de ciclos, CPI, RAWs y Branch Taken Stalls para los dos casos anteriores.
;		  Branch |		  |				  |	      |		|	  |		| 	   |  			  | 					 |
;  Target Buffer | Ciclos | Instrucciones | CPI   | RAW | WAW | WAR | Estr | Branch Taken | Branch Misprediction |
; ⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻
;		Disabled | 71	  | 43			  | 1.651 | 16  | 0   | 0   | 0    | 8            | 0                    |
;		Enabled  | 67	  | 43			  | 1.558 | 16  | 0   | 0   | 0    | 4            | 0                    |

.data
	tabla: .word 20, 1, 14, 3, 2, 58, 18, 7, 12, 11
	num: .word 7
	long: .word 10 ; Cantidad de elementos en la tabla
.code
	ld r1, long(r0)
	ld r2, num(r0)
	dadd r3, r0, r0 ; guardo el desplazamiento en la tabla (innit 0)
	dadd r10, r0, r0 ; Resultado: innit 0
loop: ld r4, tabla(r3) ; cargo el offset de la tabla en r4 + despl (innit 0)
	beq r4, r2, listo ; Comparo r4 con r3 y si son iguales salta a listo
	daddi r1, r1, -1 ; resto cantidad de caracteres restantes
	daddi r3, r3, 8 ; paso al siguiente valor de tabla
	bnez r1, loop ; Si r1 <> 0 -> voy a loop
	j fin
listo: daddi r10, r0, 1 ; encontre el dato
fin: halt