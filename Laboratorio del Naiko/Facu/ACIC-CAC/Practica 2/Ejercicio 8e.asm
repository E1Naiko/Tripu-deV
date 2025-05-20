; 8) Uso de las luces y las llaves a través del PIO.
; Ejecutar los programas con el simulador VonSim utilizando los
;   dispositivos “Llaves y Luces” que conectan las llaves al
;   puerto PA del PIO y a las luces al puerto PB.

; e) Escribir un programa que encienda una luz a la vez, de las
;   ocho conectadas al puerto paralelo del microprocesador a través
;   de la PIO, en el siguiente orden de bits:
;   0-1-2-3-4-5-6-7-6-5-4-3-2-1-0-1-2-3-4-5-6-7-6-5-4-3-2-1-0-1-...,
;  es decir, 00000001, 00000010, 00000100, etc.
;  Cada luz debe estar encendida durante un segundo.
;  El programa nunca termina.



PIO EQU 30H
; PA 30H, puerto multiproposito a
; PB 31H, puerto multiproposito b
; CA 32H, configuracion del puerto a (E/S)
; CB 33H, configuracion del puerto b (E/S)
; HANDSHAKE DATO 40H, registro de datos de la interfaz con a impresora
; HANDSHAKE ESTADO 41H, registro de estados de la interfaz con a impresora

ORG 3000H
  MULT2:
    INC BL
    
    CMP AL, 0
    JZ MULT2_CERO
      ADD AL, AL
      JMP MULT2_FIN

    MULT2_CERO:
      MOV AL, 1
    
    MULT2_FIN:
  RET

  DIV2:
    DEC BL
    CMP BL, 0
    JZ DIV2_CERO
      PUSH BX
      dec bl
      mov bh, 1
      
      DIV2_BUCLE:
      CMP BL, 0
      JZ DIV2_SIGUE
        DEC BL
        add bh, bh
        JMP DIV2_BUCLE

      DIV2_SIGUE:
      sub al, bh
      POP BX
    JMP DIV2_FIN
    
    DIV2_CERO:
      MOV AL, 0

    DIV2_FIN:
  RET

ORG 2000H
  CLI
    MOV AL, 0FFH
    OUT PIO+2, AL
    MOV AL, 0H
    OUT PIO+3, AL
  STI

  MOV BL, 0
  MOV AL, 0
  IZQ:
    CALL MULT2
    OUT PIO+1, AL
    CMP AL, 10000000B
    JNZ IZQ
    
  DER:
    CALL DIV2
    OUT PIO+1, AL
    CMP AL, 0
    JNZ DER
    
  JMP IZQ
  
  HLT
END