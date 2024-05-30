;
org 1000h
  n1 dw 1
  n2 dw 2
  p dw 0

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
  mov dx, [bx] ; n1
  mov bx, cx
  mov cx, [bx] ; n2

  ; como tengo que cambiar el valor de p a 1 cuando salgo de la subrutina,
  ; uso la direccion en vez del valor, pero si lo voy a mover
  ; a bx para poder modificarlo
  mov bx, ax

  ; comparo los n
  cmp cx, dx
    jnz finMATCH
    mov word ptr [bx], 1


  finMATCH:

  ; cargo el estado de los registros pre subrutina
  pop dx
  pop cx
  pop bx
  pop ax
ret

org 2000h
  mov ax, offset n1
  mov bx, offset n2
  mov cx, offset p

  push ax
  push bx
  push cx

  call MATCH

  pop cx
  pop bx
  pop ax
  
  hlt
end
