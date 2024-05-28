; Multiplicar pasado via registro por valor
org 1000h
  numero db 3
  cociente db 9

org 3000h
  MULTIPLICAR:
  ; guardo una copia de los registros pre subrutina
  push cx
  push dx

  ; 
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

org 2000h
  mov ax, 0
  mov bx, 0
  mov al, numero
  mov bl, cociente

  call MULTIPLICAR

  hlt
end
