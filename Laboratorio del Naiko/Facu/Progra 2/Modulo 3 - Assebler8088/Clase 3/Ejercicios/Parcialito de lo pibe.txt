ORG 1000H
  V1 DB "SERES"
  RES DB 0
  CANT DB 0
ORG 3000H

EQUALS: PUSH BX
        PUSH CX
        PUSH DX
	      MOV BX, SP
        ADD BX, 2
        MOV BX, [BX]
        MOV DL, [BX]
        MOV BX, AX
        MOV BX, [BX]
        CMP DL,[BX]
        JZ NORESU
    RESU:  MOV BX, SP
          ADD BX,6
          MOV BX,[BX]
          MOV BX, 0FFH
          JMP FIN
    NORESU:  MOV BX, SP
          ADD BX,6
          MOV BX,[BX]
          MOV BX, 000H
    FIN:
        POP DX
        POP CX
        POP BX
        RET       


ORG 2000H
  MOV AX, OFFSET V1
  MOV BX, OFFSET RES - 1
  MOV DL,0
  MOV CL, RES
  MOV CH, 0
  PUSH CX
LOOP: CALL EQUALS
      MOV DH,[BX]
      PUSH BX
      MOV BX,AX
      CMP [BX],DH
      JNZ FIN2
      POP BX
      INC DL 
      INC AX
      DEC BX
      JMP LOOP
FIN2: POP CX 
      MOV CANT, DL
  HLT
END
