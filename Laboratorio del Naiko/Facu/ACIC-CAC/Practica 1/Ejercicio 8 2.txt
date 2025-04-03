;8) Subrutinas para realizar operaciones con cadenas de caracteres Las operaciones con strings
;   son muy comunes. Por eso, vamos a escribir una pequeña colección de subrutinas reutilizables.
;
;	a) Escribir una subrutina LONGITUD que cuente el número de caracteres de una cadena de
;    caracteres terminada con un carácter que tiene el código ASCII cero (00H) almacenada
;    en la memoria. La cadena se pasa a la subrutina por referencia vía registro, y el
;    resultado se retorna por valor también a través de un registro.
;	 Ejemplo: la longitud de ‘abcd’00h es 4 (el 00h final no se cuenta)
;	
;	b) Escribir una subrutina CONTAR_MIN que cuente el número de letras minúsculas de la
;    ‘a’ a la ‘z’ de una cadena de caracteres terminada en cero almacenada en la memoria.
;    La cadena se pasa a la subrutina por referencia vía registro, y el resultado se retorna
;    por valor también a través de un registro.
;	Ejemplo: CONTAR_MIN de ‘aBcDE1#!’ debe retornar 2.
;	
;	c) * Escriba la subrutina ES_VOCAL, que determina si un carácter es vocal o no, ya sea
;    mayúscula o minúscula. La rutina debe recibir el carácter por valor vía registro, y
;    debe retornar, también vía registro, el valor 0FFH si el carácter es una vocal, o 00H en
;    caso contrario.
;	Ejemplo: ES_VOCAL de ‘a’ o ‘A’ debe retornar 0FFh y ES_VOCAL de ‘b’ o de ‘4’ debe retornar 00h
;	
;	d) * Usando la subrutina anterior escribir la subrutina CONTAR_VOC, que recibe una cadena
;    terminada en cero por referencia a través de un registro, y devuelve, en un registro, la
;    cantidad de vocales que tiene esa cadena.
;	Ejemplo: CONTAR_VOC de ‘contar1#!’ debe retornar 2
;	
;	e) Escriba la subrutina CONTAR_CAR que cuenta la cantidad de veces que aparece un carácter
;    dado en una cadena terminada en cero. El carácter a buscar se debe pasar por valor mientras
;    que la cadena a analizar por referencia, ambos a través de la pila.
;	Ejemplo: CONTAR_CAR de ‘abbcde!’ y ‘b’ debe retornar 2, mientras que CONTAR_CAR de ‘abbcde!’ y
;    ‘z’ debe retornar 0.	
;	
;	f) Escriba la subrutina REEMPLAZAR_CAR que reciba dos caracteres (ORIGINAL y REEMPLAZO) por
;    valor a través de la pila, y una cadena terminada en cero también a través de la pila. La
;    subrutina debe reemplazar el carácter ORIGINAL por el carácter REEMPLAZO.
; Ejemplo: REEMPLAZAR_CAR de un string “Hola buen día”, con ORIGINAL = “a” y reemplazo = “o” debe
;    cambiar el string para que sea “Holo buen dío”
        
        org 1000h
        string_A db "abcd"
        fin_string_A db 00h
        RES_A dw 0

        string_B db "aBcDE1#!"
        fin_string_B db 00h
        RES_B dw 0

        char_C db 'U'
        VOCALES db "AEIOUaeiou"
        FIN_VOCALES db 0
        RES_C dw 0

        string_D db "contarAAaaA1#!"
        fin_string_D db 0
        RES_D dw 0

        char_E db 'b'
        string_E db "abbcde!"
        fin_string_E db 0
        RES_E db 0

        char_F_ORIGINAL db 'a'
        char_F_REEMPLAZO db 'o'
        string_F db "hola buen dia"
        
        org 3000h
; -------------------------- Inciso A --------------------------
LONGITUD: cmp byte ptr[bx], 0
          jz finBucleLongitud
          inc ax
          inc bx
          jmp LONGITUD
          
finBucleLongitud:
        ret

; -------------------------- Inciso B --------------------------
CONTAR_MIN:
        push cx
        mov cl, 'a'
        mov ch, 'z'
        inc ch
        dec bx

bucle_CONTAR: inc bx
        cmp byte ptr [bx], 0
        jz fin_CONTAR_FIN
        cmp byte ptr [bx], cl
        js bucle_CONTAR
        cmp byte ptr [bx], ch
        jns bucle_CONTAR
        inc ax
        jmp bucle_CONTAR
        
fin_CONTAR_FIN: pop cx
        ret

; -------------------------- Inciso C --------------------------
ES_VOCAL: dec bx
bucle_ES_VOCAL: inc bx
        cmp byte ptr [bx], 0
        jz fin_NO_ES_VOCAL
        cmp al, byte ptr [bx]
        jz fin_ES_VOCAL
        jmp bucle_ES_VOCAL
        
fin_ES_VOCAL: mov ax, 0FFh
        jmp fin_Voc
fin_NO_ES_VOCAL: mov ax, 00h
fin_Voc:    ret

; -------------------------- INCISO D --------------------------
CONTAR_VOC: push cx
        push dx

        ; Contador de resultado, lo guardo en pila por ahora
        mov cx, 0
        push cx

        mov cx, ax ; cx: direccion de la cadena a trabajar
        mov dx, bx ; dx: direccion de la cadena de vocales
        
bucle_CONTAR_VOC:
        ; Comparo si puedo continuar comparando
        mov bx, cx
        cmp byte ptr [bx], 0
        jz fin_bucle_CONTAR_VOC

        ; Preparo mis registros para comparar
        mov ax, 0
        mov al, byte ptr [bx]
        mov bx, dx
        inc cx

        ; comparo y califico resultados
        call ES_VOCAL
        cmp ax, 0FFh
        jz cumple_D
        jmp bucle_CONTAR_VOC

cumple_D: pop ax
        inc ax
        push ax
        jmp bucle_CONTAR_VOC

fin_bucle_CONTAR_VOC: pop bx
        pop dx
        pop cx
        ret

; -------------------------- INCISO E --------------------------
CONTAR_CAR: push cx
        push dx
        dec bx

bucle_CONTAR_CAR:
        inc bx
        cmp byte ptr [bx], 0
        jz fin_BUCLE_CONTAR_CAR
        mov cl, byte ptr [bx]
        cmp cl, al
        jnz bucle_CONTAR_CAR
        inc ah
        jmp bucle_CONTAR_CAR

fin_BUCLE_CONTAR_CAR:
        pop dx
        pop cx
        ret

; -------------------------- INCISO F --------------------------
REEMPLAZAR_CAR:
        push ax
        push bx
        push cx
        push dx

        ; busco los valores en la pila
        mov bx, sp
        add bx, 10
        mov ax, [bx] ; direccion de la cadena
        add bx, 2
        mov cx, [bx] ; reemplazo
        add bx, 2
        mov bx, [bx]
        mov dh, byte ptr [bx] ; original
        mov bx, cx
        mov dl, byte ptr [bx] ; reemplazo
        mov bx, ax

        dec bx
bucle_REEMPLAZAR_CAR: inc bx
        cmp byte ptr [bx], 0
        jz fin_bucle_REEMPLAZAR_CAR
        cmp byte ptr [bx], dh
        jnz bucle_REEMPLAZAR_CAR
        mov byte ptr [bx], dl
        jmp bucle_REEMPLAZAR_CAR
        
fin_bucle_REEMPLAZAR_CAR:
        pop dx
        pop cx
        pop bx
        pop ax
        ret

; -------------------------- MAIN --------------------------
        org 2000h
; Iniciso A:
        mov ax, 0
        mov bx, offset string_A
        call LONGITUD
        mov RES_A, ax

; Inciso B:
        mov ax, 0
        mov bx, offset string_B
        call CONTAR_MIN
        mov RES_B, ax

; Inciso C:
        mov ax, 0
        mov al, char_C
        mov bx, offset VOCALES
        call ES_VOCAL
        mov RES_C, ax

; Inciso D:
        mov ax, offset string_D
        mov bx, offset VOCALES
        call CONTAR_VOC
        mov RES_D, bx

; Inciso E:
        mov ax, 0
        mov al, char_E
        mov bx, offset string_E
        call CONTAR_CAR
        mov RES_E, ah

; Inciso F:
        mov ax, offset char_F_ORIGINAL
        mov cx, offset char_F_REEMPLAZO
        mov bx, offset string_F
        push ax
        push cx
        push bx
        
        call REEMPLAZAR_CAR
        
        pop bx
        pop cx
        pop ax
        
        hlt
        end