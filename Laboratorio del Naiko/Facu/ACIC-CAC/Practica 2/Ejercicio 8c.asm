; 8) Uso de las luces y las llaves a través del PIO.
; Ejecutar los programas con el simulador VonSim utilizando los
;   dispositivos “Llaves y Luces” que conectan las llaves al
;   puerto PA del PIO y a las luces al puerto PB.

; c) Escribir un programa que permite encender y apagar las luces
;   mediante las llaves. El programa no deberá terminar nunca, y
;   continuamente revisar el estado de las llaves, y actualizar de
;   forma consecuente el estado de las luces. La actualización se
;   realiza simplemente prendiendo la luz i si la llave i
;   correspondiente está encendida (valor 1), y apagándola en caso
;   contrario. Por ejemplo, si solo la primera llave está encendida,
;   entonces solo la primera luz se debe quedar encendida.

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

  MOV CL, 25
  BUCLE: CMP CL, 0
    IN AL, PIO
    OUT PIO+1, AL
  JNZ BUCLE
  
  HLT
END