; Invertir Tablas (Swap)
org 1000h
  tabla db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
  finTabla db ?

org 3000h
  CANTIDAD_ELEMENTOS:
    ; guardo una copia de los registros pre subrutina
    push bx
    push cx
    push dx

    mov bx, 2
    mov cx, 0

    div: cmp ax, 2
      jc finCE

      sub ax, bx
      inc cx
      
      jmp div
    
    finCE:
    mov ax, cx
    ; cargo el estado de los registros pre subrutina
    pop dx
    pop cx
    pop bx
  ret

org 2000h

  mov bx, offset tabla
  ; dividir ax en 2
  mov ax, offset finTabla - offset tabla
  call CANTIDAD_ELEMENTOS
  mov cx, offset finTabla - 1

  ; estructura for
  for: cmp ax, 0
    jz fin

    push ax
    mov dl, byte ptr [bx] ; guardo en low el valor bajo de la tabla
    mov ax, bx
    mov bx, cx
    mov dh, [bx]  ; guardo en high el valor alto de la tabla
    mov [bx], dl
    mov bx, ax
    mov [bx], dh
    
    pop ax
    
    ; actualizo valores actuales
    dec ax
    inc bx
    dec cx
    jmp for

  fin:
  hlt
end
