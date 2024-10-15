
ORG 1000H
E db 3; valor via registro
B dw 2; ref via pila

ORG 3000H
POT:
    push bx
    push ax
    mov bx, sp
    add bx, 6
    mov bx, [bx]
    mov ah, [bx]; ah = 3
    dec al; al = 3
    mult:
        cmp ah, 0
        jz fin
        mov cx, 00h
        mov dl, al
    suma:
         add cx, [bx]; 0+3
         dec dl; 
         jnz suma
         mov [bx], cx
         dec ah
         jmp mult
         
fin:
    pop ax
    pop bx
RET
ORG 2000H
mov bx, offset B
mov al, E; mande valor registro
push bx; mande referencia via pila
CALL POT
pop bx
HLT
END





