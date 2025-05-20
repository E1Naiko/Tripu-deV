; 6) F10 con Timer
; a) Escribir un programa que implemente un conteo regresivo a partir
;   de un valor (de 1 a 9) ingresado desde el teclado. El conteo debe
;   comenzar al presionarse la tecla F10. El tiempo transcurrido debe
;   mostrarse en pantalla, actualizándose el valor cada segundo.

;   Por ejemplo, si se ingresa el valor 7, cuando se apreta F10 debe
;   mostrarse en pantalla “7 6 5 4 3 2 1 0” en los 7 segundos siguientes

; Pista: Usar un flag de estado “INICIO” que empieza con el valor 0 (Falso)
;   y se pone en 1111 1111 (Verdadero) cuando se presiona F10

PIC EQU 20H
TIMER EQU 10H
N_F10 EQU 10
N_CLK EQU 15

ORG 40
  ID_F10 DW RUT_F10
ORG 60
  ID_CLK DW RUT_CLK

ORG 1000H
  ENTRADA DB 0
  INICIO DB 0

ORG 3000H
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
    dec byte ptr [bx]
    dec dl
  IRET
    
  RUT_F10:
    mov al, PIC
    out PIC, al

    PUSH CX
    MOV CX, 0
    lectura:
      int 6
      ; chequeo que entrada sea un numero del 0-9
      MOV CL, '9'+1
      MOV CH, '0'-1
      CMP byte ptr [bx], CL
      jns lectura
      cmp byte ptr [bx], CH
      js lectura
    POP CX
    mov bx, [bx]
    MOV INICIO, 0FFH
  IRET

ORG 2000H
  CLI
    MOV AL, 0FEH
    OUT PIC+1, AL
    MOV AL, N_F10
    OUT PIC+4, AL
  STI
  
  mov bx, offset ENTRADA
  
  buclef10:
    CMP INICIO, 0FFH
    jNZ buclef10

  CLI
    ; habilito el reloj
    MOV AL, 11111101B
    OUT PIC+1, AL
    MOV AL, N_CLK
    OUT PIC+5, AL
    ; comp c/1s
    MOV AL, 1
    OUT TIMER+1, AL
    ; timer inicio en 0
    MOV AL, 0
    OUT TIMER, AL
  STI

  mov bx, offset ENTRADA
  mov al, 1
  mov dl, ENTRADA
  mov dh, '0'-1
  
  bucleCLK:
    cmp dh, dl
    jnz bucleCLK
  
  HLT
END