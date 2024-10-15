;Escribir una subrutina CONCAR que cuente el número
;de caracteres de una cadena de caracteres 
;terminada en “%” almacenada en memoria. La cadena se pasa 
;a la subrutina por referencia vía registro.
 ORG 1000H 	; Datos
    CHAR DB "HOLA MUNDO%"
    CANT DB 0
 ORG 3000H
 CONCAR: MOV CL,0 ;Inicializa el cont en 0
         MOV BX,AX ;Mueve en BX la dir. de CHAR, o sea el primer elemento
 CONTAR: MOV DL, [BX] ;Copia en DL el valor de BX
         CMP DL, '%' ;Compara si es igual el caracter %
         JZ FIN ; Si es igual salta a Fin
         INC BX ; Incrementa BX y pasa al sgte. caracter
         INC CL ; Incrementa el contador
         JMP CONTAR ; Salta siempre a CONTAR
 FIN: RET
 ORG 2000H
 MOV AX, OFFSET CHAR
 CALL CONCAR
 MOV CANT,CL
 HLT
END









