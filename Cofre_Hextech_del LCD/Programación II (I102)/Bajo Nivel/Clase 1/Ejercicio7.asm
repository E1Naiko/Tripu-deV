; ¡Bienvenido a VonSim!
;ETIQUETAS   INSTRUCCIONES   COMENTARIOS
			;Inicio de memoria de datos
ORG 1000H
  TABLA DB 2,4,6,8,10 ;Definimos la tabla con valores de 8 bytes
	RESULTADO DW 0000 ;Definimos la variable que guardara el resultado

	ORG 2000H ;Programa Principal
  MOV BX, OFFSET TABLA ;Pone en BX la direccion del primer valor de la tabla
  MOV CX, OFFSET RESULTADO ; Pone en CX la direccion del resultado
  SUB CX, BX  ;Guarda en CX la resta entre direcciones que seria la DIMF
  SUMA: MOV AL,[BX] ; Guarda en AX el valor de la tabla
        CMP CL, BL   ; Compara si la dimF es igual al dimL
        JZ END_PROG ; Salta si z=1
        ADD RESULTADO,AX  ;Acumulo los valores en Resultado
        INC BX   ;Pasq al sgte. valor de la tabla
        JMP SUMA ; Salta incondicionalmente a Suma
	END_PROG: MOV CX, RESULTADO
            HLT
	END










