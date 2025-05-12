; 5) Timer, tres usos: periódico infinito, periódico finito, y única vez

; a) Escribir un programa que muestre el mensaje “Vamos las interrupciones!”
;   una vez cada 2 segundos y no termine nunca.

; b) Modificar a) para que termine a los 10 segundos.

; c) Modificar a) para que solo imprima una vez, a los 10 segundos, y luego
;   termine.

; d) Desafío: Modificar a) para que el primer mensaje se imprima luego de 1
;   segundo, el segundo luego de 2 segundos, el tercero luego de 3, y así
;   sucesivamente, hasta que se espere 255 en el último mensaje, y el
;   programa termine,

TIMER EQU 10H
PIC EQU 20H
N_CLK EQU 10

ORG 40
  IP_CLICK DW RUT_CLK
  
org 1000H
  CADENA DB "Vamos las interrupciones!"
  FIN_CADENA DB ?

org 3000H
  RUT_CLK:
    push ax
    MOV AL, PIC
    OUT PIC, AL
    pop ax
    INT 7
    push ax
    mov al, 0
    out TIMER, al
    pop ax
  IRET
  
org 2000H
  CLI
    MOV AL, 11111101B
    OUT PIC+1, AL
    MOV AL, N_CLK
    OUT PIC+5, AL
    MOV AL, 2
    OUT TIMER+1, AL
    MOV AL, 0
    OUT TIMER, AL
  STI

  mov bx, OFFSET CADENA
  MOV AL, OFFSET FIN_CADENA - OFFSET CADENA
    
  bucle:
    jmp bucle
  
  hlt
END
