; ¡Bienvenido a VonSim!
;ETIQUETAS   INSTRUCCIONES   COMENTARIOS
			;Inicio de memoria de datos
          	ORG 1000H
  TABLA 	DB 2,4,6,8,10,12,14,16,18,20 ;Se declara una tabla con lo que empieza en la direccion de memoria 1000h con el valor 1
  FIN 	DB ? ;Declara una variable FIN de tipo byte (8bytes) con dato basura
  TOTAL 	DB 0 ; Declara Total de tipo byte (8bytes) con 0
  MAX 	DB 11 ;Declara MAX de tipo byte (8bytes) con 11 donde 11 es un num cualquiera para comparar con los valores de la tabla

       	ORG 2000H ; Se inicia el prog. Principal
       	MOV AL, 0 ;Mueve el valor 0 al registro bajo de AX
        MOV CL, OFFSET FIN - OFFSET TABLA ; en CL resta la direccion de FIN que seria [100AH] y de TABLA que seria 1000h que nos da el DIMF 
      	MOV BX, OFFSET TABLA ;En BX se mueve la direccion de Tabla que es 1000h
  COMP:	MOV AL, [BX] ;En AL copia el valor que contiene la direccion de BX o sea los valores de la tabla                  
        	INC BX ; Incrementa la direccion de BX lo que pasa al sgte valor de la tabla                          
        	DEC CL ; Decrementa CL que contiene el DimF de la tabla                      
        	CMP MAX, AL ;Compara y resta el contenido de MAX que es 11 con AL que contiene el valor de la tabla
        	JNS MINyEQ ; Salta a la etiqueta MINyEQ si el flag de Signo = 0 que se realizo en CMP  
        	CMP CL, 0 ; Compara y resta el contenido de CL que es DIMF con 0
        	JZ FINAL ; Salta a la etiqueta FINAL si el CMP anterior dio 0 o sea el flag de Zero= 1                         
        	JMP COMP ; Salto incondicional a COMP o sea siempre salta a esa Etiqueta
MINyEQ: 	ADD TOTAL, 1 ; Suma 1 a Total que seria la cantidad de num que supera a MAX
        	JMP COMP ; Salto incondicional a COMP 
FINAL: 	HLT ; Fin de la ejecucion
		END





