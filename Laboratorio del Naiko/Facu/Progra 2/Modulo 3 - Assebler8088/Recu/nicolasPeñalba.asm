ORG 1000H
  ;RONDA DONDE GANA EL JUGADOR A (PARA PROBAR)
  JUGADOR_A DB 2,3,2,3,1 ;GANADOR
  JUGADOR_B DB 1,2,3,2,1 ;PERDEDOR
  RESULTADO_RONDA DB ?,?,?,?,?
  RESULTADO_JUEGO DB ?

org 3000h
  PLAY:
    ; guardare el resultado en el registro bx
    ; ch: Jugador 1
    ; cl: Jugador 2
    push ax
    push cx

    mov ax, bx ; muevo momentaneamente la referencia al resultado para
               ; poder cargar los valores de pila
    mov bx, sp
    add bx, 6
    mov cl, byte ptr [bx] ; cargo valor de jugB
    add bx, 2
    mov ch, byte ptr [bx]  ; cargo valor de jugA
    mov bx, ax
    
    ; como N1 y N2 estan entre los valores 1 y 3, no necesito comparar
    ; casos contrarios
    cmp ch, cl
      jz empate

      cmp ch, 2
        jz JugAesPapel
      cmp ch, 1
        jz jugAesPiedra
        jnz jugAesTijera
        
      jugAesPiedra: cmp cl, 2 ; veo si jugB es papel
        jz ganaJugB
        jmp ganaJugA
        
      JugAesPapel: cmp cl, 3 ; veo si jugB es tijera
        jz ganaJugB
        jmp ganaJugA
        
      jugAesTijera: cmp cl, 1 ; veo si jugB es piedra
        jz ganaJugB
        jmp ganaJugA

    ganaJugA: mov byte ptr [bx], 'A'
      jmp finPlay
    ganaJugB: mov byte ptr [bx], 'B'
      jmp finPlay
    empate: mov byte ptr [bx], 'E'
    
    finPLAY:
    pop cx
    pop ax
  ret

org 2000h
  mov cx, offset JUGADOR_A
  mov dx, offset JUGADOR_B
  mov bx, offset RESULTADO_RONDA
  push bx ; guardo la referencia al resultado en pila para
          ; no tener que acceder a memoria al calcular el resultado
  
  mov ax, 0 ; voy a usar al para contar las rondas y
            ; ah para calcular el resultado
  
  ; PARTIDA
  buclePartida: cmp al, 5; SI SE QUIEREN DISTINTOS NUMEROS DE RONDA: CAMBIAR EL VALOR ACA Y EN LA CALCULO
    jz finPartida
    push ax
    mov ax, bx

    ; paso el valor de jugador A a la pila
    mov bx, cx
    mov bl, byte ptr [bx]
    mov bh, 0
    push bx
    ; paso el valor de jugador B a la pila
    mov bx, dx
    mov bl, byte ptr [bx]
    mov bh, 0
    push bx
    ; cargo la referencia a resultado devuelta en el registro bx
    mov bx, ax
    
    call PLAY
    pop ax ; valor de jugador B (basura)
    pop ax ; valor de jugador A (basura)
    pop ax ; contador de ronda

    inc al
    inc bx
    inc cx
    inc dx
    jmp buclePartida
  finPartida:

  ; CALCULO RESULTADO
  pop bx ; referencia a inicio de la tabla de resultados
  mov ch, 0 ; Rondas ganadas por JugA
  mov cl, 0 ; Rondas ganadas por JugB
  bucleCalcularRes: cmp ah, 5 ; SI SE QUIEREN DISTINTOS NUMEROS DE RONDA: CAMBIAR EL VALOR ACA Y EN LA PARTIDA
    jz finRes
    cmp byte ptr[bx], 'E' ; si hay un empate no sumo nada
      jz finCalc
      
      cmp byte ptr[bx], 'A' ; caso que gane el jug A
        jnz calcB
        inc ch
        jmp finCalc

        calcB: inc cl ; caso que gano el jug B
      
      finCalc:
      inc ah
      jmp bucleCalcularRes

      masB: inc cl
  
  finRes:
  cmp ch, cl
    jz resEmpate
    js resJugB
    
    mov RESULTADO_JUEGO, 0AAH ; JUGADOR A GANA
      jmp finMain
    
    resJugB: mov RESULTADO_JUEGO, 0BBH ; JUGADOR B GANA
      jmp finMain
    
    resEmpate: mov RESULTADO_JUEGO, 0EEH ; EMPATE
  
  finMain:
  hlt
end