;   Ejercicio 6.  Escriba una subrutina ES_IMPAR, que
; determina si un número (de tamaño word) es par o impar.
; La rutina debe recibir el número por valor a través de
; la pila. La subrutina debe retornar vía registro el valor 00H
; si el número es par, o 01H en caso contrario.

; Implemente un programa que utilizando la subrutina cuente
; la cantidad total de números impares en una tabla y
; almacene el resultado final en memoria principal.
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
