; Multiplicar pasado via registro por referencia
org 1000h
  numero db 3
  cociente db 9

org 3000h
  MULTIPLICAR:
  ; guardo una copia de los registros pre subrutina
  push ax
  push bx
  push cx
  push dx

  mov cx, 1
  
  cmp byte ptr [bx], 0
    jnz distintoCero
    mov dl, 0
    jmp finMulti
    
  distintoCero:
    push bx
    mov bx, ax
    mov dl, byte ptr [bx]
    pop bx
    
    multi: cmp byte ptr [bx], cl
      jz finMulti
      push bx
      mov bx, ax
      add dl, byte ptr [bx]
      pop bx
      inc cl
      jmp multi

  finMulti:
    mov bx, ax
    mov byte ptr [bx], dl

  ; cargo el estado de los registros pre subrutina
  pop dx
  pop cx
  pop bx
  pop ax
ret

org 2000h
  mov ax, offset numero
  mov bx, offset cociente

  call MULTIPLICAR

  hlt
end
