;6)Multiplicación de números sin signo.
;El simulador no posee una instrucción para multiplicar números. Escribir un programa para multiplicar
; los números NUM1 y NUM2 de 1 byte, y guardar el resultado en la variable RES, también de 1 byte.
;A.Sin usar subrutinas, implementando todo en el programa principal.

;B.Llamando a una subrutina MUL para efectuar la operación, pasando los parámetros por
;   valor desde el programa principal a través de registros y devolviendo el resultado a través
;   de un registro por valor.

;C.Llamando a una subrutina MUL, pasando los parámetros por referencia desde el programa principal
;   a través de registros, y devolviendo el resultado a través de un registro por valor.

;D.Llamando a una subrutina MUL, pasando los parámetros por valor desde el programa principal a
;   través de la pila, y devolviendo el resultado a través de un registro por valor.

;E. Llamando a una subrutina MUL, pasando los parámetros por referencia desde el programa principal
;   a través de la pila, y devolviendo el resultado a través de un registro por valor.
        org 1000h
        NUM1 db 6
        NUM2 db 7
        RES_A db 0
        RES_B db 0
        RES_C db 0
        RES_D db 0
        RES_E db 0
        org 3000h
MUL_B:  push cx
        push dx

        mov ax, 0
  bucle_B: cmp ah, bl
        jz fin_bucle_B
        inc ah
        add al, bh
        jmp bucle_B

  fin_bucle_B:
        pop dx
        pop cx
        ret

MUL_C:  push cx
        push dx

        mov cl, byte ptr [bx]
        mov bx, ax
        mov ch, byte ptr [bx]
        mov bx, cx
        mov ax, 0
        
  bucle_C: cmp ah, bl
        jz fin_bucle_C
        inc ah
        add al, bh
        jmp bucle_C

  fin_bucle_C:
        pop dx
        pop cx
        ret
MUL_D:  push ax
        push cx
        push dx

        mov ax, 0
        mov bx, sp
        add bx, 8
        mov bx, [bx]
        
  bucle_D: cmp ah, bl
        jz fin_bucle_D
        inc ah
        add al, bh
        jmp bucle_D

  fin_bucle_D:
        mov bh, 0
        mov bl, al
        
        pop dx
        pop cx
        pop ax
        ret
MUL_E:  push ax
        push cx
        push dx
        
        mov ax, 0
        mov cx, 0

        mov bx, sp
        add bx, 8
        mov ax, [bx]
        add bx, 2
        mov bx, [bx]
        mov cx, [bx]
        mov bx, ax
        mov ch, byte ptr [bx]
        mov bx, cx

        mov ax, 0
bucle_E: cmp ah, bl
        jz fin_bucle_E
        inc ah
        add al, bh
        jmp bucle_E

fin_bucle_E:
        mov bh, 0
        mov bl, al

        pop dx
        pop cx
        pop ax
        ret
        
        org 2000h
        ;; INCISO A
        mov bl, NUM1
        mov bh, NUM2
        mov ax, 0
        
        bucle_A: cmp ah, bl
        jz fin_bucle_A
        inc ah
        add al, bh
        jmp bucle_A

        fin_bucle_A: mov RES_A, al
        
        ;; INCISO B
        mov bl, NUM1
        mov bh, NUM2
        mov ax, 0
        call MUL_B
        mov RES_B, al
        
        ;; INCISO C
        mov ax, offset NUM1
        mov bx, offset NUM2
        
        call MUL_C
        mov RES_C, al
        
        ;; INCISO D
        mov bl, NUM1
        mov bh, NUM2
        push bx
        mov bx, 0
        call MUL_D
        mov RES_D, bl
        pop bx
        
        ;; INCISO E
        mov ax, offset NUM1
        mov bx, offset NUM2
        push bx
        push ax
        mov bx, 0
        call MUL_E
        mov RES_E, bl
        pop bx
        pop ax
        
fin:    hlt
        end