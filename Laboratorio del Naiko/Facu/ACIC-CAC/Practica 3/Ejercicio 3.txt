;  3) Tecla F10 El siguiente programa cuenta el número de veces
; que se presiona la tecla F10 y acumula este valor en el registro DX.
; El programa nunca termina, ya que ejecuta un loop infinito.
; Completar las instrucciones faltantes para que el programa
; funcione correctamente.

; Luego de completarlo, verifique su funcionamiento en el simulador, y
; explicar detalladamente:
; A. ¿Qué hacen las instrucciones CLI y STI? ¿Qué podría suceder si no
;   están las mismas y la persona que usa el programa presiona F10
;   rápidamente durante la configuración del PIC?
; B. ¿Por qué se usa el valor 0FEH en el programa?
; C. ¿Qué instrucciones le indican al PIC que la interrupción ha terminado?
; D. ¿En qué dirección se encuentra la subrutina que atiende las
;   interrupciones del F10?

EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H
N_F10 EQU 15

org 60
IP_F10 DW RUT_F10

ORG 2000H
  ; A) CLI y STI deshabilita y habilita las interrupciones enmascarables,
  ;  lo que permite la configuracion correcta de los dispositivos de E/S
  ; si no los deshabilitamos se pueden modificar mientras los estamos 
  ; configurando, lo que arruinaria el resultado deseado.
  CLI
    MOV AL, 0FEH ; b) OFEH = 0111 1111; habilita las interrupciones por
    out EOI+1, al
    MOV AL, N_F10
    OUT INT0, AL
    MOV DX, 0
  STI
  LAZO:JMP LAZO
  
ORG 3000H
  RUT_F10:
    PUSH AX
    INC DX
    MOV AL, EOI
    OUT EOI, AL ; C1) actualizo a el valor de EOI al velor pre interrupcion
    POP AX
  IRET ; C2) iret indica el retorno post interrupcion
END