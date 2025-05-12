; Ej 4
PIO EQU 30H
ORG 1000H
  MSJ DB "ARQUITECTURA DE "
      DB "COMPUTADORAS"
  FIN DB ?

ORG 2000H 
  ; Configuro la PIO,
  ;  PIO = 30H
  ; CA = 0FDH = 1111 1101 -> B=entrada S=salida

  MOV AL, 0FDH 
  OUT PIO+2, AL ; 32h = posicion de CA
  ; CB = 0 = 0000 0000 -> PB = Salida
  MOV AL, 0 
  OUT PIO+3, AL 

  ; Fuerzo Strobe a 0
  IN AL, PIO 
  AND AL, 0FDH
  OUT PIO, AL 

  ; Traigo la direccion del mensaje a impresora
  MOV BX, OFFSET MSJ 
  MOV CL, OFFSET FIN-OFFSET MSJ 
  
  POLL:
    ; Chequeo si la impresora esta ocupada o no (leo busy)
    IN AL, PIO 
    AND AL, 1 
    JNZ POLL 

    ; comienzo el movimiento de datos a la impresora
    MOV AL, [BX] 
    OUT PIO+1, AL ; mando al puerto de datos el char a imprimir

    ; voy a hacer un pulso para que la impresora siga
    ; fuerzo strobe a 1
    IN AL, PIO 
    OR AL, 02H 
    OUT PIO, AL 
    ; fuerzo strobe a 0
    IN AL, PIO 
    AND AL, 0FDH 
    OUT PIO, AL 

    ; siguiente char
    INC BX
    DEC CL
    
    JNZ POLL
    
  HLT
END
