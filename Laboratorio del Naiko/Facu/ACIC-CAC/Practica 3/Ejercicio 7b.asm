; 7) HANDSHAKE con interrupciones
; b) Modificar a) de modo que el string a imprimir se lea desde teclado.
;   El string a leer tiene una longitud fija de 10 caracteres, y se
;   lee de forma completa antes de comenzar la impresión.

PIC EQU 20H
HAND EQU 40H
N_HND EQU 10

ORG 40
  ID_HND DW RUT_HND

ORG 1000H
  CADENA DB ".........."
  FIN_CADENA DB ?

ORG 3000H
  LEER_CADENA:
    PUSH BX
    PUSH CX

    BUCLE_LEER_CADENA:
      INT 6
      INC BX
      DEC CL
      CMP CL, 0
      JNZ BUCLE_LEER_CADENA

    POP CX
    POP BX
  RET
  
  RUT_HND:
    PUSH AX
    ; ENVIO EL VALOR ACTUAL DE LA CADENA CON HANDSHAKE
    MOV AL, [BX]
    OUT HAND, AL

    ; ACTUALIZO VALOR ACTUAL DE LA CADENA
    INC BX
    DEC CL
    
    ; DESHABILITO LAS INTERRUPCIONES
    MOV AL, 00100000B
    OUT PIC, AL
    
    POP AX
  IRET
  
ORG 2000H
  MOV BX, OFFSET CADENA
  MOV CL, OFFSET FIN_CADENA - OFFSET CADENA

  CALL LEER_CADENA
  
  CLI
    ; ABRO EL HANDSHAKE POR INTERRUPCION
    MOV AL, 11111011B
    OUT PIC+1, AL

    ; ENVIO LA DIRECCION DE LA SUBRUTINA AL VECTOR DE INT
    MOV AL, N_HND
    OUT PIC+6, AL
    
    ; ABRO EL HANDSHAKE
    MOV AL, 10000000B
    OUT HAND+1, AL
  STI
  
  BUCLE:
    CMP CL, 0
    JNZ BUCLE

  ; CIERRO EL HANDSHAKE
  IN AL, HAND+1
  AND AL, 01111111B
  OUT HAND+1, AL
  
  HLT
END