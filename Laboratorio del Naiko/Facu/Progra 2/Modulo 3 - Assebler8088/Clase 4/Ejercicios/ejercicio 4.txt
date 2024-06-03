; Clase 4: Ejercicio 2.
;Escribir una subrutina CONCAR que cuente el número de
; caracteres de una cadena de caracteres terminada en “%”
; almacenada en memoria. La cadena se pasa a la subrutina
; por referencia vía registro.

org 1000h
  cadena db "aefn%vsdnpvbuosdfnv"
  fin db "%"
  cantidad dw 0

org 3000h
  CONCAR:
    push bx
    push cx
    mov cx, 0
    
    bucle: cmp byte ptr [bx], al
      jz finConcar
      inc bx
      inc cx
      jmp bucle
    finConcar:

    mov bx, dx
    mov [bx], cx
    pop cx
    pop bx
  ret
  
org 2000h
  mov bx, offset fin
  mov ax, [bx]
  mov bx, offset cadena
  mov cx, 0
  mov dx, offset cantidad

  call CONCAR

hlt
end
