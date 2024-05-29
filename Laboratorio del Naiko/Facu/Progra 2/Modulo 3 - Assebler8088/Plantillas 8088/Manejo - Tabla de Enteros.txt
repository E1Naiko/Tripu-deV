; manejo basico de tabla de enteros
org 1000h
  tabla db 1, 2, 3, 4, 5
  finTabla db ?

org 2000h

  mov bx, offset tabla
  mov ax, offset finTabla - offset tabla
  mov cx, 0

  ; estructura for
  for: cmp ax, 0
    jz fin

    ; operaciones con las que necesitamos el recorrido de la tabla
    mov cl, byte ptr [bx]

    ; actualizo valores actuales
    dec ax
    inc bx
    jmp for

  fin:
  
  hlt
end
