; 8) Uso de las luces y las llaves a través del PIO.
; Ejecutar los programas con el simulador VonSim utilizando los
;   dispositivos “Llaves y Luces” que conectan las llaves al
;   puerto PA del PIO y a las luces al puerto PB.

; a) Escribir un programa que encienda las luces con el patrón
;   11000011, o sea, solo las primeras y las últimas dos luces
;   deben prenderse, y el resto deben apagarse.

PIO EQU 30H
; PA 30H, puerto multiproposito a
; PB 31H, puerto multiproposito b
; CA 32H, configuracion del puerto a (E/S)
; CB 33H, configuracion del puerto b (E/S)
; HANDSHAKE DATO 40H, registro de datos de la interfaz con a impresora
; HANDSHAKE ESTADO 41H, registro de estados de la interfaz con a impresora

ORG 2000H
  CLI
    MOV AL, 0FFH
    OUT PIO+2, AL
    MOV AL, 0H
    OUT PIO+3, AL
    MOV AL, 11000011B
    OUT PIO+1, AL
  STI

  BUCLE:
    JMP BUCLE
  HLT
END