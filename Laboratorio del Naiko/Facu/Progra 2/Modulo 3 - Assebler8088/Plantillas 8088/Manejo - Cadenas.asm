; manejo basico de tabla de enteros
org 1000h
  string db "asdasdef"
  finString db ?
  vocales db "AEIOUaeiou"
  finVocales db ?

org 3000h
  ES_VOCAL:
    ; Veo si todavia quedan elementos restantes en la tabla
    cmp ax, 0
      jz noPertenece

      ; si todavia tengo elementos para comparar
      cmp [bx], cl
        jz pertenece
        ; actualizo los restantes y paso al elemento siguiente
        inc bx
        dec ax
      jmp ES_VOCAL

    ; actualizo resultados - SE PUEDE CAMBIAR POR LO QUE SE NECESITE
    pertenece: mov dx, 0FFH
      jmp fin
    noPertenece: mov dx, 00H
    
  fin: ret

org 2000h

  mov bx, offset string
  mov ax, offset finString - offset string
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
