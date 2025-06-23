; 7) Escribir un programa que recorra una TABLA de diez números enteros y determine
;  cuántos elementos son mayores que X. El resultado debe almacenarse en una dirección
;  etiquetada CANT. El programa debe generar además otro arreglo llamado RES cuyos
;  elementos sean ceros y unos. Un ‘1’ indicará que el entero correspondiente en el
;  arreglo TABLA es mayor que X, mientras que un ‘0’ indicará que es menor o igual.

.data
	TABLA: .word 11, 3, 4, 5, 6, 7, 8, 9, 10, 12
	TABLACANT: .word 10
	CANT: .word 0
	RES: .word 1, 1, 1, 1, 1, 1, 1, 1, 1, 1

.code
	dadd r5, r0, r0 ; auxiliar para resultado de comparacion
	dadd r4, r0, r0 ; Dezplazamiento de la tabla
	ld r3, TABLACANT(r0) ; cantidad total de elementos
	ld r6, CANT(r0) ; cantidad total de elementos

	bucle: ld r2, TABLA(r4)
		daddi r3, r3, -1 ; actualizo cantidad restante
		
		slti r5, r2, 11
		
		; Estructura IF
		bnez r5, esMenor
		j siguiente

		esMenor: daddi r6, r6, 1
			sd r0, RES(r4) ; guardo en tabla de resultados + Dezplazamiento el valor 1

	siguiente:
		daddi r4, r4, 8 ; actualizo Dezplazamiento
		bnez r3, bucle
		j fin

	fin: sd r6, CANT(r0)

halt