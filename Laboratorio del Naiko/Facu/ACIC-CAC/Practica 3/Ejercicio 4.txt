; 4) Tecla F10 con pantalla y terminación

; A) Escribir un programa que muestre en pantalla “Vamos las interrupciones!”
;   cada vez que se presiona la tecla F10. El programa nunca termina.

; B) Idem A pero ahora el programa termina luego de que se muestra 5 veces
;   el mensaje.

; Pista: cuando se ejecuta la 5ta interrupción, deben deshabilitarse
;   las mismas para evitar reaccionar a próximas pulsaciones de la tecla F10.
;   Utilizar una variable global para registrar cuántas veces falta
;   mostrar el mensaje antes de terminar.

PIC EQU 20H
N_F10 EQU 10

org 40
  P_F10 dw RUT_F10

org 1000H
  CADENA db "Vamos las interrupciones!"
  FIN_CADENA db ?
  MAX db 5

org 3000H
  RUT_F10:
    push ax
    push bx
    mov al, PIC
    out PIC, al
    MOV BX, OFFSET CADENA
    MOV AL, OFFSET FIN_CADENA - OFFSET CADENA
    int 7
    pop ax
    pop bx
    inc cl
    iret
    
org 2000H
  CLI
    MOV AL, 0FEH
    OUT PIC+1, AL
    MOV AL, N_F10
    OUT PIC+4, AL
  STI

  mov ch, MAX
  bucleousmaximus: cmp ch, cl
    jz fin
    jmp bucleousmaximus
  fin:
  hlt
END
