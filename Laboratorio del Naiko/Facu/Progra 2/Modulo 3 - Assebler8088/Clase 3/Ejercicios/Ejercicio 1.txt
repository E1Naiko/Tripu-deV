; TP3 Ejercicio 1: Escribir un programa que calcule la suma de
; dos números de 32 bits almacenados en la memoria del
; microprocesador sin hacer llamados a subrutinas, resolviendo 
; el problema desde el programa principal.

ORG 1000H
  NUM1H dw 0
  NUM1L dw 49152
  NUM2H dw 0
  NUM2L dw 32768
  RESH dw 0
  RESL dw 0

ORG 2000H
  mov ax, NUM1H
  mov bx, NUM1L
  mov cx, NUM2H
  mov dx, NUM2L

  add bx, dx
  JNC SIN_CARRY
  INC cx
  SIN_CARRY: add ax, cx

  mov RESH, ax
  mov RESL, bx
  hlt
;ORG 3000H
END
