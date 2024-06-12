;minúsculas están en el rango 61H..7AH 
;mayúsculas en el rango 41H..5AH

ORG 1000h
TABLA DB  "e4stE&3s.el.r3çup3R@t0r1o!"
ABC   DB  "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrTt"

ORG 3000H
MAYUS:
    PUSH AX
    PUSH BX
    MOV BX,SP
    ADD BX,6
    MOV BX,[BX]
    MOV AL,[BX]

    ; PARTE IMPORTANTE
    mov cl,61h
    ;mov al,61h
    ;add al,24;seleccionar letra. se puede cambiar por un mov
    sub al,cl    
    mov ch,41h;dir de la primera letra Myuscula

resul: 
    add ch,al
    mov dl,cl

    ; FIN PARTE IMPORTANTE

FIN2: POP BX
      POP AX
RET
ORG 2000h  
MOV AX ,OFFSET TABLA 
PUSH AX
CALL MAYUS
POP AX

FIN: HLT
END
