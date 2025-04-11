; 1) Mostrar mensajes en la pantalla de comandos. El siguiente
;    programa del lenguaje assembler del simulador VonSim
;    muestra en la pantalla de comandos un mensaje previamente
;    almacenado en memoria de datos, aplicando la interrupción
;    por software INT 7.

; a) Ejecutar en el simulador ¿qué imprime?
; RTA: Imprime "ARQUITECTURA DE COMPUTADORAS-FACULTAD
;      DE INFORMATICA-UNLP"

; b) Con referencia a la interrupción INT 7, ¿qué se almacena en
;    los registros BX y AL?
; RTA: bx almacena la direccion del primer caracter a imprimir
;    al almasena la cantidad de elementos a imprimir

ORG 1000H
  MSJ DB "ARQUITECTURA DE COMPUTADORAS-"
      DB "FACULTAD DE INFORMATICA-"
      DB 55H ; U hex
      DB 4EH ; N hex
      DB 4CH ; L hex
      DB 50H ; P hex
  FIN DB ?

ORG 2000H
  MOV BX, OFFSET MSJ
  MOV AL, OFFSET FIN - OFFSET MSJ
  
  INT 7
  
  INT 0
END