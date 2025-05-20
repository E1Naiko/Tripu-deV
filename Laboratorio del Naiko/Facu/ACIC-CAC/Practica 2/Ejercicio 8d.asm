; 8) Uso de las luces y las llaves a través del PIO.
; Ejecutar los programas con el simulador VonSim utilizando los
;   dispositivos “Llaves y Luces” que conectan las llaves al
;   puerto PA del PIO y a las luces al puerto PB.

; d) Escribir un programa que implemente un encendido y apagado
;   sincronizado de las luces. Un contador, que inicializa en cero,
;   se incrementa en uno una vez por segundo. Por cada incremento,
;   se muestra a través de las luces, prendiendo solo aquellas luces
;   donde el valor de las llaves es 1. Entonces, primero se enciende
;   solo la luz de más a la derecha, correspondiente al patrón 00000001.
;   Luego se continúa con los patrones 00000010, 00000011,
;   y así sucesivamente. El programa termina al llegar al patrón 11111111.



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
  STI

  MOV AL, 0
  BUCLE:
    INC AL
    OUT PIO+1, AL
  CMP CL, 0FFH
  JNZ BUCLE
  
  HLT
END