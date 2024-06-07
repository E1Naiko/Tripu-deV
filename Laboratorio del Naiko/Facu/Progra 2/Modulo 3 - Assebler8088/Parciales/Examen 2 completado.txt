org 1000h
  Bases dw 2,5,4,7,3
  finBases dw ?
  Exponentes dw 6,5,3,3,8
  finExponentes dw ?
  cont dw 0

org 3000h

  MULTIPLICAR:
    ; ax -> numero
    ; bx -> cociente
    ; guardo una copia de los registros pre subrutina
    push cx
    push dx
  
    ; uso cx para contar cuantas operaciones hice
    mov cx, 1
    
    cmp bx, 0
      jnz distintoCero
      mov dx, 0
      jmp finMulti
      
    distintoCero:
      mov dx, ax
      multi: cmp bx, cx
        jz finMulti
        add dx, ax
        inc cx
        jmp multi
  
    finMulti: mov ax, dx
  
    ; cargo el estado de los registros pre subrutina
    pop dx
    pop cx
  ret
  
  ; reciba un numero B por referencia a travez de la pila y
  ; un numero E por valor a traves de registros
  ; para calcular la potencia de BË
  ; El resultado debe almacenarse en el parametro por referencia
  
  POT:
    ; guardo valores de los registros pre subrutina en pila
    ; ax, E
    push bx
    push cx
    push dx

    ; ax -> valor E
    ; encuentro la direccion de memoria en la pila
    mov bx, sp
    add bx, 8
    mov bx, [bx] ; bx -> referencia a B
    mov dx, [bx]

    mov cx, 1 ; cuantas potencias hice

    buclePot: cmp ax, cx
      jz finBuclePot
      push ax
      push bx
      mov ax, [bx]
      mov bx, dx
      
      ; ax -> numero
      ; bx -> cociente
      call MULTIPLICAR

      pop bx
      mov [bx], ax
      pop ax
      
      inc cx
      jmp buclePot

    finBuclePot:
    
    pop dx
    pop cx
    pop bx
  ret
org 2000h
  ; voy a guardar en la pila la cantidad de elementos que
  ; cuyas potencias aplicadas quedaron por debajo de 100
  mov ax, 0
  push ax

  ; cargo en registro las direcciones de los elementos de las
  ; tablas y donde terminan las mismas
  mov ax, offset Bases
  mov bx, offset Exponentes
  mov cx, offset finBases
  mov dx, offset finExponentes

  bucleMain:
  ; comparo si aun quedan bases y exponentes para usar
  cmp ax, cx 
  jz finMain
  cmp bx, dx
  jz finMain
    ; si aun quedan valores para calcular exponencial, calculo
    ; guardo temporalmente las direcciones finales de las tablas
    ; para poder usar los registros cx y dx libremente
    push cx
    push dx
    push ax ; referencia a B

    mov ax, [bx] ; valor de E
    
    call POT

    pop ax
    push bx

    ; actualizo el valor del cont en pila en
    ; caso que el numero sea menor a 100
    mov bx, ax
    cmp Word ptr [bx], 100
      jns sig
      mov bx, sp
      add bx, 6
      inc Word ptr[bx]
      
    sig:
    pop bx
    pop dx
    pop cx
    add ax, 2
    add bx, 2
  jmp bucleMain

  finMain: 
  ; actualizo el valor de cont
  pop ax
  mov cont, ax
  
  hlt
end
