`; TP3 Ejercicio 2: Escribir un programa que calcule la
; suma de dos números de 32 bits almacenados en la
; memoria del microprocesador llamando a una subrutina
; SUM32 para efectuar la operación, pasando los
; parámetros por valor desde el programa principal a
; través de registros.

org 1000h
  NUM1H dw 0
  NUM1L dw 49152
  NUM2H dw 0
  NUM2L dw 32768
  RESH dw 0
  RESL dw 0

ORG 3000H

  SUM32: add bx, dx
         JNC SIN_CARRY
         INC cx
         SIN_CARRY: add ax, cx
         mov RESH, ax
         mov RESL, bx
    ret

org 2000h
  mov ax, offset NUM1H
  mov bx, offset NUM1L
  mov cx, offset NUM2H
  mov dx, offset NUM2L

  hlt
end`