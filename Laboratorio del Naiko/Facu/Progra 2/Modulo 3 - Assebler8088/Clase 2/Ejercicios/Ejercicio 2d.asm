ORG 1000H
  TABLA 	DB 2,4,6,8,10,12,14,16,18,20
  FIN 	DB ?
  TOTAL 	DB 0
  MAX 	DB 11

ORG 2000H
  MOV AL, 0
  MOV CL, OFFSET FIN - OFFSET TABLA ; guarda la cantidad de elementos de la tabla
  MOV BX, OFFSET TABLA ; guarda la direccion del inicio de la tabla

  COMP:	MOV AL, [BX] ; asigna registro A en campo low el valor del registro BX
  ;; --- Estructura for
          INC BX ; pos siguiente de la tabla
          DEC CL ; actualiza los elementos restantes
  
          ; ------ COMO MAX = 11, este programa guarda la cantidad de numeros menores a 11 ------
          CMP MAX, AL ; la operacion cmp compara por medio de la resta de ambos valores, se pueden prender todas las flags
          JS MINyEQ ; en caso que max<[AL] entonces entra en MINyEQ, ya que si o si cmp<0 -> [AL]<MAX

          ; Si se llega al final de la tabla -> cantElementos = 0 -> CMP = 0 -> ZF=1
          CMP CL, 0
        	JZ FINAL

          ; Si no se llega al final de la tabla ni se actualiza la cantid
        	JMP COMP
  ;; --- fin Estructura for
  
MINyEQ: 	ADD TOTAL, 1
        	JMP COMP

FINAL: 	HLT
END
