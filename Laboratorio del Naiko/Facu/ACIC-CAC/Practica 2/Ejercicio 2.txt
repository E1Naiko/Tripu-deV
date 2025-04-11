;  2) Lectura de datos desde el teclado.
;  El siguiente programa solicita el ingreso de un número
;  (de un dígito) por teclado e inmediatamente lo muestra en la
;  pantalla de comandos, haciendo uso de las interrupciones por
;  software INT 6 e INT 7.

;  a) Con referencia a la interrupción INT 6, ¿qué se almacena en BX?
;  RTA: bx almacena la direccion en memoria donde se debe almacenar el
;      char leido por teclado

;  b) En el programa anterior, ¿qué hace la segunda interrupción INT 7?
;  RTA: imprime numero almacenado en 1500h NUM DB 

;  c) ¿Qué valor queda almacenado en el registro CL?
;  RTA: En cl queda guardado una copia del ultimo char ingresado por teclado

ORG 1000H
  MSJ DB "INGRESE UN NUMERO:"
  FIN DB ?

ORG 1500H
  NUM DB ?

ORG 2000H
  MOV BX, OFFSET MSJ
  MOV AL, OFFSET FIN-OFFSET MSJ
  INT 7
  MOV BX, OFFSET NUM

  ; Acá
  INT 6
  MOV AL, 1
  
  INT 7
  MOV CL, NUM
  
  INT 0
  END