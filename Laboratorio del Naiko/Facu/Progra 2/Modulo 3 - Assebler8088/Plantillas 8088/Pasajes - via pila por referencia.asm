; Pasaje via pila por referencia
org 1000h
  dato dw 5

org 3000h
  SUBRUTINA:
  ; guardo una copia de los registros pre subrutina
  push ax
  push bx
  push cx
  push dx

  ; Busco el dato en la pila
  mov bx, sp
  add bx, 10

  ; cargo el estado de los registros pre subrutina
  pop dx
  pop cx
  pop bx
  pop ax
ret

org 2000h
  mov ax, dato
  push ax

  call SUBRUTINA

  pop ax
  hlt
end