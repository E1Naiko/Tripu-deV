;Escribir un programa que calcule la suma de dos
;números de 32 bits almacenados en la memoria del
;microprocesador llamando a una subrutina SUM32,
;pasando los parámetros por referencia desde el 
;programa principal a través de registros.
  org 1000h
  num1_a dw 0ffffh
  num1_b dw 0001
  num2_a dw 0ffffh
  num2_b dw 0001
  org 3000h
  SUM32: PUSH BX ;Apila BX en la pila
         PUSH AX ;Apila AX en la pila
         MOV BX,SP ;Trae el tope de la pila a BX
         ADD BX,6 ;Incrementamos BX en la dir. del num1_a
         MOV BX,[BX] ;Asigna a BX la direccion del num 1
         MOV AX,[BX] ;Asigna a AX el valor contenido en la dir de BX
         
         MOV CX, [BX]
         
  FIN: RET
        
  org 2000h
  MOV AX, OFFSET num1_a ;Asigna a AX la DIR DE parte alta del num1
  MOV BX, OFFSET num2_a ;Asigna a AX la DIR DE parte alta del num2
  PUSH AX
  PUSH BX
  call SUM32
  hlt
  end 







