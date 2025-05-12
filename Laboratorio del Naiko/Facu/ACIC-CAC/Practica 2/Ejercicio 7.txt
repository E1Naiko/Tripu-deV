; 7) Contraseña Escribir un programa que aguarde el ingreso de una
; contraseña de cuatro caracteres por teclado sin visualizarla en
; pantalla. En caso de coincidir con una clave predefinida
; (y guardada en memoria) que muestre el mensaje "Acceso permitido";
; caso contrario mostrar el mensaje "Acceso denegado", y volver a
; pedir que se ingrese una contraseña. Al 5to intento fallido,
; debe mostrarse el mensaje “Acceso BLOQUEADO” y terminar el programa.

ORG 1000H
  INTENTOS db 5
  CLAVE db "1234"
  FIN_CLAVE db ?
  
  MSJ_AUTORIZADO db "Acceso permitido"
  FIN_MSJ_AUTORIZADO db ?
  MSJ_NO_AUTORIZADO db "Acceso denegado"
  FIN_MSJ_NO_AUTORIZADO db ?

ORG 1500H
  claveAct db "...."
  finClaveAct db ?

ORG 3000h
  leerClave:
    push ax
    push bx
    push cx
    
    mov cx, offset finClaveAct - offset claveAct
    repeat_leerClave:
      int 6
      inc bx
      inc ch
    cmp ch, cl
    jnz repeat_leerClave
    
    pop cx
    pop bx
    pop ax
  ret
  
  compararClave:
    push ax
    push bx
    push cx

    mov cl, offset FIN_CLAVE - offset CLAVE ; contador de iteraciones
    mov ch, 0
    mov dl, cl ; contador de asierto
    mov dh, 0

    ; recorrido para comparar
    ;  ax offset CLAVE
    ;  bx offset claveAct
    ;  ch contRecorrido=0, dl totalRecorrido=4
    ;  dh asiertos=?, dl asiertosQueDebenCumplir=4
    
    repeat_compararClave:
      push ax
      push bx
      push dx
      
      mov dx, ax ; dx: offset CLAVE[n]
      mov ax, bx
      mov ah, byte ptr [bx] ; ah: CLAVE al:?
      
      mov bx, dx ; bx: offset claveAct
      mov al, byte ptr [bx] ; ah: CLAVE[n] al:claveAct[n]

      pop dx
      cmp ah, al
      jnz sigue_compararClave
      inc dh

      sigue_compararClave:
      pop bx
      pop ax
      inc bx
      inc ax
      inc ch
      
    cmp ch, cl
    jnz repeat_compararClave

    ; fin del recorrido
    ;  ax ?
    ;  bx ?
    ;  cx ?
    ;  dh asiertos, dl asiertosQueDebenCumplir
    cmp dh, dl
    jnz compararClave_NO_cumple
    
    ; voy a usar dx para deolver mi dato: 00FFh para TRUE, 0h para FALSE
    compararClave_cumple: mov dx, 0FFh
      jmp fin
    compararClave_NO_cumple:  mov dx, 0
    fin:
    
    pop cx
    pop bx
    pop ax
  ret
  
ORG 2000H
  mov cl, 0
  mov ch, INTENTOS
  mov bx, offset CLAVE
  mov ax, bx
  mov bx, offset claveAct

  repeat_main_lectura:
    mov dx, 0
    call leerClave
    call compararClave

    push ax
    push bx
    mov ax, 0

    cmp dx, 0FFh
    jnz main_no_cumple
        mov al, offset FIN_MSJ_AUTORIZADO - offset MSJ_AUTORIZADO
        mov bx, offset MSJ_AUTORIZADO
        int 7
      jmp fin_cumple

    main_no_cumple:
      mov al, offset FIN_MSJ_NO_AUTORIZADO - offset MSJ_NO_AUTORIZADO
      mov bx, offset MSJ_NO_AUTORIZADO
      int 7
    pop bx
    pop ax
    inc cl
    
  cmp ch, cl
  jnz repeat_main_lectura
  jz fin_main

  fin_cumple:
    pop bx
    pop ax
    
  fin_main:
  hlt
  END