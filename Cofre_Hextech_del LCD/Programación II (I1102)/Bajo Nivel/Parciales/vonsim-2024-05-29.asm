
ORG 1000H
TABLA_A DB 1,2,5,4,30
TABLA_B DB 1,7,5,9,7
CANT DB ?
ORG 3000H
SUBRUTINA: PUSH BX
           PUSH CX
           PUSH DX
           MOV CL, [BX] ;TRAIGO EL VALOR TABLAB QUE PASAMOS POR REF VIA REGISTRO{1}
           ;EN AL TENEMOS EL VALOR DE TABLAA POR VALOR VIA REGISTRO
           MOV DL,1 ;DONDE GUARDAMOS EL RESULTADO
REPEAT: 
 
        MOV DH,0
        MOV AH,2
        
SUMA:  ADD DH,DL
       DEC AH
       JNZ SUMA
       MOV DL,DH
    
        ADD AL, 1 ;SUMO 1 AL VALOR DE LA TABLA_A
        CMP AL,CL ;CONDICION DE CORTE DEL REPEAT
        JZ REPEAT
        
        JMP RESUL
        
RESUL:  MOV [BX], DL
FINSUB: 
        POP DX
        POP CX
        POP BX   
        RET
ORG 2000H
MOV AX, OFFSET TABLA_A
MOV BX, OFFSET TABLA_B
MOV DH, OFFSET TABLA_B - OFFSET TABLA_A
MOV CH, 0
HAGOSUBRUTINA: CMP CL, [BX]
               JNS SGTEVALOR
               ;PUSH AX
               ;PUSH BX
               ;PUSH CX
               CALL SUBRUTINA
               ;POP CX
               ;POP BX
               ;POP AX    
SGTEVALOR: CMP DH,0
           JZ FIN
           INC BX
           INC AX
           DEC DH
FIN:  MOV CANT, CH 
      HLT
END





