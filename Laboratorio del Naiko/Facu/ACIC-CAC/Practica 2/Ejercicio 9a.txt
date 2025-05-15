; 9) Uso de la impresora a través de la PIO
; Ejecutar los programas configurando el simulador VonSim con los
; dispositivos “Impresora (PIO)”. En esta configuración, el puerto
; de datos de la impresora se conecta al puerto PB del PIO, y los
; bits de busy y strobe de la misma se conectan a los bits 0 y 1
; respectivamente del puerto PA. Presionar F5 para mostrar la salida
; en papel. El papel se puede blanquear ingresando el comando BI.

; PIO
; PA 30H: XXXXXXSB. REGISTRO DE ESTADO
; PB 31H: DDDDDDDD. REGISTRO DE DATOS
; CA 32H: XXXXXX01.
; CB 33H: 00000000.

; a) Escribir un programa para imprimir la letra “A” utilizando la
;   impresora a través de la PIO.

; b) Escribir un programa para imprimir el mensaje “ORGANIZACION
;   Y ARQUITECTURA DE COMPUTADORAS” utilizando la impresora a
;   través de la PIO.

; c) Escribir un programa que solicita el ingreso de cinco
;   caracteres por teclado y los envía de a uno por vez a la
;   impresora a través de la PIO a medida que se van ingresando.
;   No es necesario mostrar los caracteres en la pantalla.

; d) Escribir un programa que solicite ingresar caracteres por
;   teclado y que recién al presionar la tecla F10 los envíe a la
; impresora a través de la PIO. No es necesario mostrar los
;   caracteres en la pantalla.



PIO EQU 30H

ORG 3000H

ORG 2000H
  CLI
    IN AL, PIO+2
    AND AL, 11111101B
    OR AL, 00000001B
    OUT PIO+2, AL
  STI
  
  HLT
END