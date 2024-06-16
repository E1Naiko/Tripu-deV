; SIN TESTEAR
;   Ejercicio 5.  Dado los siguientes datos en la memoria de
; datos, escriba un programa en Assembler que recorra la
; tabla y llame a una subrutina que sume el VALOR a cada
; posición de TABLA (recibe ambos valores por pila). Decida
; qué pasaje de parámetros es más conveniente para cada dato.
;
org 1000h
    TABLA DB 1,4,5,3,10,7,14,78,23,18
    VALOR DB 3

org 3000h
    SUMA_A_ELEMENTOS:
    ; subrutina que sume el VALOR a cada posición de TABLA
    ; (recibe ambos valores por pila).

    ; guardo una copia de los registros pre subrutina
    push ax
    push bx
    push cx
    push dx

    ; Voy a buscar la direccion a la pila
    mov bx, sp
    add bx, 10
    mov ax, [bx]
    add bx, 2
    mov cx, [bx]
    mov bx, cx
    mov bx, [bx]

    add bx, ax

    ; cargo el estado de los registros pre subrutina
    pop dx
    pop cx
    pop bx
    pop ax
ret

org 2000h
    mov ax, VALOR
    mov bx, offset TABLA
    mov cx, offset TABLA - offset VALOR
    ; estructura while
    while: cmp cx, 0
        jz fin

        push ax
        push bx

        call SUMA_A_ELEMENTOS

        pop ax
        pop bx

        inc bx
        dec cx
        jmp while
    fin:
    hlt
end