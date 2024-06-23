; ¡Bienvenido a VonSim!
;ETIQUETAS   INSTRUCCIONES   COMENTARIOS
			;Inicio de memoria de datos
org    1000h ;Direccion de declaracion de datos
  datos db 55h,33h, 44h, 22h ; Declara Datos una tabla de bytes empieza en 1000h y termina en 1003h
org    2000h ;Direccion de Prog. Principal
  mov   BX,1000h ;Asigna a Bx la direccion del primer valor de la tabla
  mov   AX, [BX]  ; Asigna a AX el valor de la direccion de BX
  push  AX  ;Apila Ax en la pila en 7FFFH
  mov   BX, 1002h ;Asigna a BX la direccion del tercer elemento de la tabla
  mov   CX, [BX] ;Asigna la direccion de BX a CX
  push  CX ; Apila CX en la pila en 7FFEH
  pop    AX ;Desapila AX de la pila
  pop    CX ;Desapila CX de la pila
  hlt      ;Termina la ejecucion
end    ; Fin del Programa







