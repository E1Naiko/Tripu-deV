; Ejercicio 6: Usando la subrutina anterior escribir la subrutina
; VOCALES, que recibe una cadena por referencia, y devuelve, en un
; registro, la cantidad de vocales que tiene esa cadena

org 1000h
  tablaVocales db "AEIOUaeiou"
  finVocales db ?
  cadena db "asaegsdfhngosdfgAA"
  finCadena db ?

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

    ; actualizo resultados
    pertenece: mov dx, 0FFH
      jmp fin
    noPertenece: mov dx, 00H
    
  fin: ret


  VOCALES:
    mov cl, [bx] ; Elemento a comparar
    inc bx
    dec ax
    
    push ax
    push bx
    push dx
    
    mov bx, offset tablaVocales ; Posicion Actual de Vocales
    mov ax, offset finVocales - offset tablaVocales ; Cantidad de Elementos en tabla
    call ES_VOCAL

    cmp dx, 0FFH
      jnz noPerteneceVocales
      pop dx
      inc dx
      jmp finVoc

    noPerteneceVocales: pop dx

    finVoc: pop bx
    pop ax

    ; caso que queden elementos en cadena
    cmp ax, 0
    jnz VOCALES
    
  ret
  
org 2000h
  mov ax, offset finCadena - offset cadena
  mov bx, offset cadena
  mov cx, 0
  mov dx, 0
  call VOCALES
  hlt
end
