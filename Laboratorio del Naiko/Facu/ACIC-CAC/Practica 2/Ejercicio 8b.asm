; 8) Uso de las luces y las llaves a través del PIO.
; Ejecutar los programas con el simulador VonSim utilizando los
;   dispositivos “Llaves y Luces” que conectan las llaves al
;   puerto PA del PIO y a las luces al puerto PB.

; b) Escribir un programa que verifique si la llave de más a
;   la izquierda está prendida. Si es así, mostrar en pantalla
;   el mensaje “Llave prendida”, y de lo contrario mostrar
;   “Llave apagada”. Solo importa el valor de la llave de más
;   a la izquierda (bit más significativo). Recordar que las
;   llaves se manejan con las teclas 0-7.

PIO EQU 30H
; PA 30H, puerto multiproposito a
; PB 31H, puerto multiproposito b
; CA 32H, configuracion del puerto a (E/S)
; CB 33H, configuracion del puerto b (E/S)
; HANDSHAKE DATO 40H, registro de datos de la interfaz con a impresora
; HANDSHAKE ESTADO 41H, registro de estados de la interfaz con a impresora

ORG 1000H
  CADENA_SI DB "Llave prendida"
  FIN_SI DB ?
  CADENA_NON DB "Llave apagada"
  FIN_NON DB ?

ORG 2000H
  CLI
    MOV AL, 0FFH
    OUT PIO+2, AL
    MOV AL, 0H
    OUT PIO+3, AL
  STI

  MOV CL, 25
  BUCLE: CMP CL, 0
    DEC CL
  JNZ BUCLE
  
  IN AL, PIO
  AND AL, 10000000B
  CMP AL, 0H
    JNZ SIS
    
    MOV BX, OFFSET CADENA_NON
    MOV AL, OFFSET FIN_NON - OFFSET CADENA_NON
    INT 7
    JMP FIN

  SIS:
    MOV BX, OFFSET CADENA_SI
    MOV AL, OFFSET FIN_SI - OFFSET CADENA_SI
    INT 7
  FIN:
  HLT
END