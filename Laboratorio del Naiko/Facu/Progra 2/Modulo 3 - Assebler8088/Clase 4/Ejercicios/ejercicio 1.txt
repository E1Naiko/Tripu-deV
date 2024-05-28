;; Tp4 Ejercicio 1 SIN TERMINAR:
; Escribir una subrutina ROTARIZQ que haga una rotación hacia la izquierda de los
; bits de un byte almacenado en la memoria del microprocesador. Dicho byte y el
; número de posiciones a rotar deben pasarse por valor desde el programa principal
; a la subrutina a través de registros.

org 1000h
  dato db 10100000b
  numPosiciones db 3

org 3000h
  ROTARIZQ:
  ; guardo una copia de los registros pre subrutina
  push ax
  push bx
  push cx
  push dx

  ; cargo en registro los parametros pasados via pila por referencia
  mov bx, sp
  add bx, 8
  mov ax, [bx] ; uso ax para guardar TEMPORALMENTE la direccion de numPosiciones
  add bx, 2
  mov cx, [bx] ; uso cx para guardar la direccion de dato
  mov bx, ax
  mov ax, [bx] ; uso ax para guardar el valor de numPosiciones

  ; cargo el estado de los registros pre subrutina
  pop dx
  pop cx
  pop bx
  pop ax
ret

org 2000h
  mov ax, offset dato
  mov bx, offset numPosiciones
  push ax
  push bx

  call ROTARIZQ

  pop bx
  pop ax
  hlt
end
