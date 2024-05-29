; Pasaje via registro por valor
org 1000h
  dato dw 1

org 3000h
  SUBRUTINA:
  ; guardo una copia de los registros pre subrutina
  push bx
  push cx
  push dx

  ; cargo el estado de los registros pre subrutina
  pop dx
  pop cx
  pop bx
ret

org 2000h
  mov ax, dato

  call SUBRUTINA

  hlt
end