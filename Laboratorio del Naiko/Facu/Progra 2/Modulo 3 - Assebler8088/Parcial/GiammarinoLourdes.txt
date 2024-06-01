a) 

  org 1000h

N1 db 2
N2 db 1
P db ?




  org 3000h

MATCH: PUSH BX

       MOV BX, SP
       ADD BX, 4
       MOV BX, [BX]
       CMP AL, AH
       JZ cambiar
       jmp fin

cambiar:  MOV BYTE PTR [BX], 1


fin: POP BX
    ret


  org 2000h

MOV AL, N1
MOV AH, N2
MOV BX, OFFSET P
PUSH BX
CALL MATCH 
POP BX


  hlt 
  end




b y c) 

  org 1000h

Numero db 1, 8
Comparaciones db 0, 0
Jugadas db 2, 3, 4, 8, 1, 5, 6, 7  ; Prueba, gana pero utilizo una tabla completa para probar si funciona el corte. 
resultado db ? 

  org 3000h

MATCH: PUSH BX    ; pusheo para no perder el valor que tenía BX antes de entrar

       MOV BX, SP   ; coloco BX en el apuntador de la pila
       ADD BX, 4    ; salto la dirección del IP
       MOV BX, [BX]  ; guardo en BX, la dirección de memoria guardada en esa posición de la pila
       CMP CL, AL    ; Comparo el valor de la jugada con el del número
       JZ cambiar    
       jmp fin

cambiar:  MOV BYTE PTR [BX], 1    ; si son iguales coloco 1 en la posición apuntada por BX


fin: POP BX       ; saco el valor de la pila
    ret


VERIFICAR: MOV BX, OFFSET comparaciones  ; verifica si ya ganó o aún no 
           MOV AL, [BX]
           CMP AL, 1
           JNZ PERDIO
           INC BX
           MOV AL, [BX]
           CMP AL, 1
           JNZ PERDIO
           JMP GANO
           

PERDIO:    MOV resultado, 00h
           JMP finR

GANO:      MOV resultado, 0FFh

finR: ret

  org 2000h

  MOV DX, 0   ; inicializo un contador en 0 para poder recorrer el vector

RECORRER_JUGADAS: MOV BX, OFFSET Numero
                  MOV AL, [BX]
                  
                  MOV BX, OFFSET jugadas
                  ADD BX, DX   ; incremento BX según DX, para llevar las posiciones de la tabla y poder usar BX en otros procesos
                  MOV CL, [BX] ; Guardo el valor de la jugada
                  
                  MOV BX, OFFSET comparaciones
                  PUSH BX      ; Envío a PILA la dirección de memoria de comparacion
                  CALL MATCH
                  POP BX

                  CALL VERIFICAR    ; Verifico si el jugador ganó
                  CMP Resultado, 0FFh  ; Si ganó, termina la ejecución
                  JZ fin1
                  
                  INC DX      ; incremento el contador
                  
                  CMP DX, OFFSET resultado - OFFSET jugadas   ; verifico que no se terminaron las jugadas
                  JZ termino
                  
                  MOV BX, OFFSET Numero ; Hago lo mismo con el segundo dígito y la segunda posición de comparación
                  INC BX 
                  MOV AL, [BX]

                  MOV BX, OFFSET jugadas
                  ADD BX, DX
                  MOV CL, [BX]

                  MOV BX, OFFSET comparaciones
                  INC BX
                  PUSH BX
                  CALL MATCH 
                  POP BX
                
                  CALL VERIFICAR
                  CMP Resultado, 0FFh
                  JZ fin1
                  
                  INC DX
                  
                  CMP DX, OFFSET resultado - OFFSET jugadas
                  JZ termino
                  
                  JMP RECORRER_JUGADAS

TERMINO: CALL PERDIO  ; Si se terminó y no se verificó que ganó, coloca el registro en 00h

fin1:  hlt 
       end