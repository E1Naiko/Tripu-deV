;
org 1000h

org 3000h
  SUBRUTINA:
  ; guardo una copia de los registros pre subrutina
  push ax
  push bx
  push cx
  push dx

  ; cargo el estado de los registros pre subrutina
  pop dx
  pop cx
  pop bx
  pop ax
ret

org 2000h

  call SUBRUTINA

  ; estructura if else
  if: cmp ax, 0
    jz caso1
    cmp ax, 1
    jz caso2
    jmp fin

    caso1:
      mov ax, 0
      jmp fin
    caso2:
      mov ax, 0
      jmp fin

  ; estructura for
  for:
    cmp cx, 0
    jz fin
    dec cx
    jmp for

  ; estructura while
  while:
    cmp cx, 0
    jz fin
    jmp while

  ; estructura repeat until
  repeat:
    cmp cx, 0
    jz repeat

  fin: mov ax, 0

  hlt
end
