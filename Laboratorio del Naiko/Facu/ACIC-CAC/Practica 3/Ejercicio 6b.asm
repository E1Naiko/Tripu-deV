; 6) F10 con Timer
; b) Escribir un programa que cuente de forma regresiva desde 9
;  hasta 0, mostrando el tiempo en pantalla. Luego de que termine
;  de contar, si se presiona F10 debe comenzar de nuevo la cuenta
;  desde 9 hasta 0. Además, si en algún momento se presiona la
;  tecla F10 durante el conteo, el mismo debe pausarse,
;  y reanudarse sólo cuando se presiona nuevamente F10.

; Pista: Utilizar un flag de estado “PAUSA” que se controla
;  mediante la tecla F10, y que la subrutina del timer puede
;  consultar para saber si debe decrementar el contador y mostrar
;  en pantalla.

TIMER EQU 10H
PIC EQU 20H
N_F10 EQU 10
N_CLK EQU 15

ORG 40
  ID_F10 DW RUT_F10
  
ORG 60
  ID_CLK DW RUT_CLK
  
ORG 1000H
  PAUSA DB 0H
  ESP DB 10
  SEG DB '9'

ORG 3000H
  RESET_CLK:
    PUSH AX
    
    MOV AL, PIC
    OUT PIC, AL
    MOV AL, 0
    OUT TIMER, AL
    
    POP AX
  RET
  
  RUT_F10: ; FALTA TERMINAR, no puedo hacer que funcione bien el reseteo del reloj
    call RESET_CLK
    CMP PAUSA, 0FFH
    JZ RUT_F10_REANUDAR
    CMP BYTE PTR [BX], '0'-1
    JZ RUT_F10_TERMINO

    ; caso: SE HACE UNA PAUSA
    MOV CL, BYTE PTR [BX]
    MOV BYTE PTR [BX], '0'-1
    MOV PAUSA, 0FFH
  
    JMP RUT_F10_FIN

    RUT_F10_TERMINO:
    ; caso: SE LLEGO AL FINAL DEL CONTADOR, reinicio el contador en 9
    MOV BYTE PTR [BX], '9'
    JMP RUT_F10_FIN

    ; caso: SE INTENTA REANUDAR EL RECORRIDO DEL CONTADOR
    RUT_F10_REANUDAR:
      MOV BYTE PTR [BX], CL
      MOV CL, 0
      MOV PAUSA, 0H
    
    RUT_F10_FIN:
  IRET

  RUT_CLK:
    CALL RESET_CLK
    CMP BYTE PTR [BX], '0'-1
    JZ RUT_CLK_FIN
      INT 7
      DEC SEG
    RUT_CLK_FIN:
  IRET
  
ORG 2000H
  MOV PAUSA, 0H
    CLI
      ; habilito el reloj y la tecla f10
      MOV AL, 11111100B
      OUT PIC+1, AL
      ; reloj
      MOV AL, N_CLK
      OUT PIC+5, AL
      ; f10
      MOV AL, N_F10
      OUT PIC+4, AL
      
      ; comp c/1s
      MOV AL, 1
      OUT TIMER+1, AL
      
      ; timer inicio en 0
      MOV AL, 0
      OUT TIMER, AL
    STI
  MOV BX, OFFSET SEG
  MOV AL, 1
  MOV CX, 0
  
  BUCLE:
    JMP BUCLE
  HLT
END