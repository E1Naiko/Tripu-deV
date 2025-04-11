; 4) Impresión y conteo.

; A) Escribir una subrutina que reciba un número X del 0 al 9 y
; muestre el mensaje “X elefantes se balanceaban…”. Utilizar la
; subrutina para escribir un programa que imprima el mensaje variando
; X desde 0 a 9.

; B) Modificar la subrutina anterior para permitir números desde 0 al 99.

; Pista: Modificar la subrutina para recibir dos números X e Y, de
; forma tal que el número 25 se representa con X=2 e Y=5. Tener en
; cuenta que números de dos dígitos son representados por dos caracteres.

ORG 1000H
  NUM10 db '0'
  NUM1 db '1'
  MSJ db " elefantes se balanceaban.  "
  FIN_MSJ db ?
  ESP db 10

ORG 3000h
  Imprimir:
    push cx
    mov cx, 0
    
    bucle: int 7
      inc NUM1
      push bx
      mov bx, offset ESP
      mov cl, al
      mov al, 1
      int 7

      pop bx
      mov al, cl
      
      inc dl
      cmp dh, dl
      jnz bucle
      
    pop cx
    ret

ORG 2000H
  mov cx, 0
  mov ch, 9
  
  mov dx, 0
  mov dh, 9
  mov al, offset FIN_MSJ - offset NUM1 - 1
  mov bx, offset NUM1
  call Imprimir

  hlt
  END