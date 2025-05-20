HAND EQU 40H 

ORG 1000H 
  MSJ DB "FACULTAD DE " 
      DB "INFORMATICA" 
  FIN DB ? 
    
ORG 2000H 
  ; configuro la HAND: Dato: 40H Estado: 41H
  ; 7FH: 0111 1111
  ;      IXXX XXSB
  ; En lectura
  ;      I: INT (1: se activa la linea INT cuando busy no este activa)
  ;      S: Strobe (1: Strobe activada)
  ;      B: Busy (1: Busy activada)

  ; En escritura
  ;   IXXX XXXX
  ;      I: INT (1: se activa la linea INT cuando busy no este activa)
  ;      S: Strobe (1: Strobe activada)
  ;      B: Busy (1: Busy activada)

  IN AL, HAND + 1
  AND AL, 7FH
  OUT HAND + 1, AL

  ; paso el msj a imprimir
  MOV BX, OFFSET MSJ 
  MOV CL, OFFSET FIN-OFFSET MSJ 
  
  POLL:
  ; bucle: mientras Busy=1
  IN AL, HAND+1 
  AND AL, 1
  JNZ POLL

  ; envio a imprimir
  MOV AL, [BX]
  OUT HAND, AL

  ; paso a siguiente
  INC BX 
  DEC CL 
  JNZ POLL 
  
  HLT 
END