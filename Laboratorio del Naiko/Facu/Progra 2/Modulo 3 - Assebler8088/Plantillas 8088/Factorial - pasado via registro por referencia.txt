; Factorial pasado via registro por referencia
org 1000h
  numero db 5

org 3000h
  MULTIPLICAR:
  ; guardo una copia de los registros pre subrutina
  push cx
  push dx

  mov cx, 1
  
  cmp bl, 0
    jnz distintoCero
    mov dl, 0
    jmp finMulti
    
  distintoCero:
    mov dl, al
    multi: cmp bl, cl
      jz finMulti
      add dl, al
      inc cl
      jmp multi

  finMulti: mov al, dl

  ; cargo el estado de los registros pre subrutina
  pop dx
  pop cx
ret

FACTORIAL:
  ; guardo una copia de los registros pre subrutina
  push bx
  push cx
  push dx

  mov bx, ax
  ; comparo si el valor actual es 1 o 0
  cmp byte ptr [bx], 0
    jnz distinto
    cmp byte ptr [bx], 1
    jnz distinto
    mov dl, 1
    jmp finFactorial

    distinto:
      mov cx, 1
      mov dx, 1
      
      bucle: cmp byte ptr [bx], cl
        jz finFactorial
        inc cl
        push ax
        push bx
        
        mov al, dl
        mov bl, cl

        call MULTIPLICAR

        mov dl, al

        pop bx
        pop ax
        jmp bucle

  finFactorial: 
    mov bx, ax
    mov byte ptr [bx], dl

  ; cargo el estado de los registros pre subrutina
  pop dx
  pop cx
  pop bx
ret

org 2000h
  mov ax, offset numero

  call FACTORIAL

  hlt
end
