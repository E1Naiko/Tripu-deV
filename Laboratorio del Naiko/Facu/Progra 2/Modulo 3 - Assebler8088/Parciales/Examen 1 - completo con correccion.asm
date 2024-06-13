org 1000h
  contCambios db 0
  cadena db "**MI_cONTraSEñA.UnICa" ; -> **M!_c0NTraS3ñ@.un!Ca
  finCadena db ?
  tablaVocales db "AEIOU"
  finVocales db ?
org 3000h
  ES_VOCAL:
     ; mov al, caracter
     ; mov bx, offset vocales ; guarda la direccion del inicio de la tabla
     ; mov cx, offset finVocales - offset vocales ; guarda la cantidad de elementos de la tabla
    push ax
    push bx
    push cx

    bucleEs_Vocal:
    mov dh, byte ptr [bx]; actualizo el valor actual de la tabla
    dec dl ; actualiza los elementos restantes

    ; Comparo si el valor esta dentro de la tabla
    cmp al, dh
      jz SeEncontro

      ; Comparo si se llego al final de la tabla
      cmp dl, 0
        jz NoSeEncontro
        inc bx ; pos siguiente de la tabla
        jmp bucleEs_Vocal

        ; Actualizo Resultados
      SeEncontro: mov dx, 00H
                  jmp finEsVocal
      NoSeEncontro: mov dx, 0FFH

    finEsVocal: 
    pop cx
    pop bx
    pop ax
  ret

  ENCRYPT: ; reciba un caracter por referencia a través de la pila
    ; El resultado debe almacenarse en el parámetro por referencia. Los caracteres
    ; sustitutos NO pueden estar almacenados en la memoria.
    ; CASOS:
    ; 1) si el caracter es “A”, debe sustituirlo por el caracter “@”
    ; 2) si el caracter es “E” debe sustituirlo por el numero “3”,
    ; 3) si el caracter es “I”, debe cambiarlo por el caracter “!”
    ; 4) si el caracter es “O” debe cambiarlo por el número “0”
    ; 5) si el caracter “U” debe reemplazarlo por su minúscula, es decir, el caracter “u”

    ; “A”: 41H, “E”: 45H, “I”: 49H, “O”: 4FH y “U”: 55H, mientras que la
    ; letra “u”: 75H, por su parte el “@”: 40H, el “!”: 21H y los números están en el rango 30H..39H.

    mov bx, sp
    add bx, 2
    mov bx, [bx]

    cmp byte ptr [bx], 41H ; A -> @
      jz Caso1
    cmp byte ptr [bx], 45H ; E -> 3
      jz Caso2
    cmp byte ptr [bx], 49H ; I -> !
      jz Caso3
    cmp byte ptr [bx], 4FH ; O -> 0
      jz Caso4
    cmp byte ptr [bx], 55H ; U -> u
      jz Caso5

    Caso1: mov byte ptr [bx], 40H
      jmp finENCRYPT
    Caso2: mov byte ptr [bx], 33H
      jmp finENCRYPT
    Caso3: mov byte ptr [bx], 21H
      jmp finENCRYPT
    Caso4: mov byte ptr [bx], 30H
      jmp finENCRYPT
    Caso5: mov byte ptr [bx], 75H
    
    finENCRYPT:
  ret
org 2000h
  ; el programa debe contabilizar aquellos caracteres que fueron sustituidos. Este valor
  ; debe quedar almacenado en memoria.

  mov bx, offset cadena ; Valor Actual de la cadena
  mov dh, offset finCadena - offset cadena ; Contador de Caracteres Restantes
  mov ax, offset tablaVocales ; Tabla Vocales
  mov dl, offset finVocales - offset tablaVocales ; Contador Vocales
  mov cl, 0; CONTADOR DE CAMBIOS REALIZADOS
  
  bucleMain: cmp dh, 0
    jz finMain

    ; mov al, caracter
    ; mov bx, offset vocales ; guarda la direccion del inicio de la tabla
    ; mov cx, offset finVocales - offset vocales ; guarda la cantidad de elementos de la tabla
    push bx
    push dx
    push cx
    push ax

    mov al, [bx]
    ; como lo tenias antes que corrija el profe
    ;mov bx, sp
    ;mov bx, [bx]
    pop bx
    mov cx, 0
    mov cl, dl

    call ES_VOCAL

    cmp dx, 00H
      jnz NoEsVocal

      ; SI es vocal
      ;pop ax ; Tabla Vocales - pre correccion del profe
      mov ax, bx ; Tabla Vocales
      pop cx
      pop dx ; dh: Contador de Caracteres Restantes, dl: Contador Vocales
      inc cl ; si EsVocal devuelve 00H, es porque el caracter es vocal mayuscula
             ; -> si o si, hay cambio

      Call ENCRYPT
      
      pop bx ; Valor Actual de la cadena
      
      jmp sigMain

    NoEsVocal:
    ;pop ax
    mov ax, bx ; tabla vocales
    pop cx ; contador de cambios
    pop dx ; dh: Contador de Caracteres Restantes, dl: Contador Vocales
    pop bx ; tabla de Caracteres

    sigMain:
    inc bx
    dec dh
    jmp bucleMain
  finMain:
  mov contCambios, cl
  hlt
end
