;  3) Mostrar caracteres individuales

;  a) Escribir un programa que muestre en pantalla todos los caracteres
;  del ASCII extendido disponibles en el simulador VonSim, comenzando con
;  el carácter cuyo código es el número 1 y terminando con el 255.
 
;  b) Escribir un programa que muestre en pantalla las letras mayúsculas
;  (“A” a la “Z”).

;  c) Escribir un programa que muestre en pantalla los dígitos
;  (“0” al “9”)

;  d) Modificar el ejercicio c) para que cada dígito se muestre en
;  una línea separada.

;  Pista: El código ASCII del carácter de nueva línea es el 10,
;  comúnmente llamado “\n” o LF (“line feed” por sus siglas en
;  inglés y porque se usaba en impresoras donde había que “alimentar”
;  una nueva línea)

;  e) Modificar el inciso b) para mostrar las mayúsculas junto con
;  las minúsculas intercaladas (AaBb…)

ORG 1000H
  DATO db 1

ORG 2000H
;  a) Escribir un programa que muestre en pantalla todos los caracteres
;  del ASCII extendido disponibles en el simulador VonSim, comenzando con
;  el carácter cuyo código es el número 1 y terminando con el 255.

  int 7

  INT 0
  END