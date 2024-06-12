; TP3 Ejercicio 3: Ejercicio 3.  Escribir un programa que calcule la suma
; de dos números de 32 bits almacenados en la memoria del microprocesador
; llamando a una subrutina SUM32, pasando los parámetros por referencia
; desde el programa principal a través de registros.
; https://excalidraw.com/#json=Mjx6DqGXroajLKWmlf94x,nANL5XDYz8pxM9THqpYIbw

org 1000h
  Num1H dw 0     ; 1000h
  Num1L dw 49152 ; 1002h
  Num2H dw 0     ; 1004h
  Num2L dw 32768 ; 1006h
  ResH dw 0      ; 1008h
  ResL dw 0      ; 100Ah

ORG 3000H
  SUM32: ; Reserva de los Registros
         push ax
         push bx
         push cx
         push dx

         ; RESERVO espacio en los registros para poder calcular
         push cx
         push dx
         mov cx, 0
         mov dx, 0

         ; calculo la suma de NumeroLow
         add cx, [bx]
         mov bx, ax
         add cx, [bx]
         
         jnc SinCarry
         inc dx

         ; calculo la suma de NumeroHigh
         SinCarry:
         pop bx
         pop ax
         add dx, [bx]
         mov bx, ax
         add dx, [bx]

         ; actualizo el resultado de la suma
         mov ResL, cx
         mov ResH, dx

         ; Devolver de los Registros
         pop dx
         pop cx
         pop bx
         pop ax
    ret

org 2000h
  mov ax, offset Num1L
  mov bx, offset Num2L
  mov cx, offset Num1H
  mov dx, offset Num2H

  call SUM32

  hlt
end
