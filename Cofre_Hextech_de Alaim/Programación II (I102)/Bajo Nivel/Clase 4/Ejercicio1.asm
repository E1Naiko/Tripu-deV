;Escribir una subrutina ROTARIZQ que haga una rotación hacia la izquierda
;de los bits de un byte almacenado en la memoria del microprocesador. 
;Dicho byte y el número de posiciones a rotar deben pasarse por valor 
;desde el programa principal a la subrutina a través de registros.
 ORG 1000H 	; Datos
    DATOS DB 1,2,3,4,5
    CANTPOS DB 2
 ORG 3000H
 ROTARIZQ: MOV AH,[BX] ;En BX trae el valor de la tabla
 ROTACION: CMP AL,0 ;Comparo la cantidad de posicion si es 0
           JZ FIN
           MOV AH,AH ;Suma para multiplicar *2
           ADC AH,0 ;Suma si hay carry
           DEC AL ;De
           JMP ROTACION
 FIN: MOV[BX],AL
      RET
 ORG 2000H
 MOV BX, OFFSET DATOS
 MOV AL, CANTPOS
 MOV CH, OFFSET CANTPOS - OFFSET DATOS; CAL la DimL de la tabla
 LOOP: CMP CH,0
       JZ FINPROG
       CALL ROTARIZQ
       INC BX ;Paso al sgte valor de la tabla
       DEC CH ;Disminuyo la cantidad de elementos de la tabla a evaluar
 FINPROG: HLT
END









