;
org 1000h
  NUMERO_A_ADIVINAR DB 1,8
  COMPARACIONES DB 0,0
  JUGADAS DB  2,3,4,8,1 ;RONDA GANADORA (PARA PROBAR)
  ;JUGADAS DB 2,3,4,8,8,3,3,4,5 ;RONDA PERDEDORA (PARA PROBAR)
  
  RESULTADO dw ?

org 3000h
  MATCH:
    ; guardo una copia de los registros pre subrutina
    push ax
    push bx
    push cx
    push dx
  
    ; recupero las direcciones de memoria de n1, n2 y p
    mov bx, sp
    add bx, 10
    mov ax, [bx] ; offset p
    add bx, 2
    mov cx, [bx] ; offset n2
    add bx, 2
    mov bx, [bx] ; offset n1
  
    ; voy a usar cx y dx para comparar ambos numeros directamente
    mov dl, byte ptr [bx] ; n1
    mov bx, cx
    mov cl, byte ptr [bx] ; n2
  
    ; como tengo que cambiar el valor de p a 1 cuando salgo de la subrutina,
    ; uso la direccion en vez del valor, pero si lo voy a mover
    ; a bx para poder modificarlo usando el puntero
    mov bx, ax
  
    ; comparo los n
    cmp cl, dl
      jnz finMATCH
      mov byte ptr [bx], 1
  
  
    finMATCH:
  
    ; cargo el estado de los registros pre subrutina
    pop dx
    pop cx
    pop bx
    pop ax
  ret

org 2000h
  mov ax, offset NUMERO_A_ADIVINAR ; n1
  mov bx, offset JUGADAS ; n2
  mov cx, offset COMPARACIONES ; p
  mov dx, 0 ; contador de intentos

  ; --- INCISO B - Partida en curso ---
  ; estructura repeat until
  repeat:
    ; voy a usar temporalmente a dx para ver si se
    ; se actualiza el valor de la comparación, para eso voy a guardar
    ; su valor temporalmente
    push dx
    mov dx, 0
    
    ; a su vez voy a cargar la pila temporalmente con el valor de bx (offset n2) para poder
    ; usar el puntero y comparar si p1 o p2 ya se encontraron
    push bx
    mov bx, cx


    ; COMPARACION DEL PRIMER NUMERO
    cmp byte ptr [bx], 1
      jz yaTengoPrimerNumero

      ; descargo la pila
      pop bx

      ; paso los parametros via registro por pila a la subrutina match
      push ax
      push bx
      push cx
      
      call MATCH

      pop cx
      pop bx
      pop ax

      ; actualizo si se pudo encontrar
      ; de nuevo, guardo temporalmente bx para usar el puntero
      push bx
      mov bx, cx
      cmp byte ptr [bx], 1
        jz actualizoPrimero
        pop bx
        jmp siguientePrimero

      actualizoPrimero:
        mov dh, 1
        jmp siguientePrimero

    yaTengoPrimerNumero:
      pop bx

    siguientePrimero:
    inc cx


    ; COMPARACION DEL SEGUNDO NUMERO
    inc ax
    push bx
    mov bx, cx
    cmp byte ptr [bx], 1
      jz yaTengoSegundoNumero

      ; descargo la pila
      pop bx

      ; paso los parametros via registro por pila a la subrutina match
      push ax
      push bx
      push cx
      
      call MATCH

      pop cx
      pop bx
      pop ax

      ; actualizo si se pudo encontrar
      ; de nuevo, guardo temporalmente bx para usar el puntero
      push bx
      mov bx, cx
      cmp byte ptr [bx], 1
        jz actualizoSegundo
        pop bx
        jmp siguienteSegundo

      actualizoSegundo:
        mov dl, 1
        jmp siguienteSegundo

    yaTengoSegundoNumero:
      pop bx

    siguienteSegundo:
    dec cx
    dec ax
    
    ; actualizo al siguiente valor de la tabla
    inc bx

    ; actualizo la cantidad de intentos
    cmp dh, 1
      jz noActualizo
    cmp dl, 1
      jz noActualizo
      
      pop dx
      inc dx
      jmp sigAct
      
    noActualizo:
    pop dx
    
    sigAct:
    
    ; compruebo si se cumple la condicion de victoria
    push ax
    push bx
    push cx
    
    mov bx, cx
    mov ax, [bx]

    cmp ah, 1
      jnz siguiente
      cmp ah, al
      jz finPartidaGano

    siguiente:
      pop cx
      pop bx
      pop ax
    
    ; compruebo si se cumple la condicion de perdida
    cmp dx, 4
    jnz repeat
    jmp finPartida



  ; --- FIN DE PARTIDA ---
  finPartidaGano:
    pop cx
    pop bx
    pop ax
    
  finPartida:

  ; INCISO C
  ; actualizo el resultado final
  ; si se llego a este punto, es porque o el jugador se quedo sin
  ; intentos O gano, por lo tanto solo verifico si le restan intentos
  ; como controlo cuantos intentos se tomaron en la partida
  ; si o si, se llega a este punto con intentos entre 0 y 4
  cmp dx, 4
    jnz gano
    mov RESULTADO, 00H
    jmp finMain

    gano: mov RESULTADO, 0FFH
    finMain:
  hlt
end
