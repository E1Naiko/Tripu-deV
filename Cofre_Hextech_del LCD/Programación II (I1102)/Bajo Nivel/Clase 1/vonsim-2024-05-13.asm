; ¡Bienvenido a VonSim!
;ETIQUETAS   INSTRUCCIONES   COMENTARIOS
			;Inicio de memoria de datos
ORG 1000H
    NUM1 DB 2    ;Asigna a num1 el 2
    NUM2 DB 4    ;Asigna a num2 el 4
ORG 2000H
    MOV BL, NUM1
    MOV AL, NUM2
    MOV DL, NUM1
    MOV CL, 1
MULTI: CMP BL,CL
       JZ FIN
       INC CL
       ADD AL,DL
       JMP MULTI
FIN: HLT
END


