; ¡Bienvenido a VonSim!
;ETIQUETAS   INSTRUCCIONES   COMENTARIOS
			;Inicio de memoria de datos
ORG 1000H
    NUM1 DB 2    ;Asigna a num1 el 2
    NUM2 DB 4    ;Asigna a num2 el 4
ORG 2000H
    MOV BL, NUM1  ;ASigna a BL el num1
    MOV AL, NUM2  ;Asigna a AL el num2
    MOV DL, NUM1  ;Asigna a Dl el num1
    MOV CL, 1     ;Incremente CL a uno
MULTI: CMP BL,CL  ;Compara BL con CL
       JZ FIN      ;Salta a FIN si el cmp dio flag z=1
       INC CL     ;Incrementa a 1 el CL
       ADD AL,DL  ;Suma en AL DL lo que acumula los 2 que tiene NUM1
       JMP MULTI  ;Salta incondicionalmente a MULTI
FIN: HLT
END


