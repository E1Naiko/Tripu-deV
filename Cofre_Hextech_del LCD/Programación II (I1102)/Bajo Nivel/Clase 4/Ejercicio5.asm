;Escribir un programa que calcule la suma de dos
;números de 32 bits almacenados en la memoria del
;microprocesador llamando a una subrutina SUM32,
;pasando los parámetros por referencia desde el 
;programa principal a través de registros.
 ORG 1000H 	; Datos
DIVIDENDO 	DW 11
DIVISOR		DW 2
RESUL		DW  ?
	
 ORG 3000H  ; Subrutina
REST:		PUSH BX ;POne lo que hay en BX en la pila
		MOV BX, SP ;EN BX pone el tope de la pila
		ADD BX, 4  ; SP+4, porque hay un push antes de llevar al la dir de donde estaba bx 
		MOV DX, [BX] ;Copia en DX la direccion de lo que hay de Resul
SIGO:		SUB AX, CX ;Resta AX y CX, DIVIDENDO - DIVISOR
 		CMP AX, CX ;COMPARA DIVIDENDO - DIVISOR
 		JNC SIGO ; Salta si Dividendo es mayor a Divisor
		MOV BX, DX ;Copia en BX la dir. de Resultado
		MOV [BX],AX ;Copia en BX el valor del resultado
		POP BX ;Popea BX
		RET
 ORG 2000H   ; Programa Ppal.
	 	MOV DX, OFFSET RESUL ;A DX paso la dir. de RESULTADO
		PUSH DX ; Pongo DX en la pila
		MOV AX, DIVIDENDO ;Muevo en AX el valor de DIVIDENDO 11
		MOV BX, OFFSET DIVISOR ; Muevo en BX la dir. de Divisor
		MOV CX, [BX] ; Mueve en CX el valor de BX o sea el DIVISOR
		CALL REST ;Llama a la subrutina REST
		POP CX ;Trae devuelta el valor de CX al prog
	 	HLT
	 	END










