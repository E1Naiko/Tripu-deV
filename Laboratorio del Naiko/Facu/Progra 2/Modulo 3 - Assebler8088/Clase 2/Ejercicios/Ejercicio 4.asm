; Ejercicio 4. Escriba un programa en lenguaje Assembly que permita sumar dos
; operandos de tipo DW. Si la suma da como resultado el valor 100, se termina
; el programa. En cambio, si la suma da como resultado un valor mayor a 100 se
; debe ir decrementando en 1 el resultado hasta poder terminar. (Se termina
; cuando el número llega a 100).

ORG 1000H
  OP1 DW 90
  OP2 DW 16
  MAYORQUE DW 100

ORG 2000H
  mov bx, OP1
  mov ax, OP2
  add bx, ax
    
  cmp MAYORQUE, bx
  js CASO
  jmp FIN
  CASO: dec bx
        cmp MAYORQUE, bx
        js CASO
  FIN: hlt
END