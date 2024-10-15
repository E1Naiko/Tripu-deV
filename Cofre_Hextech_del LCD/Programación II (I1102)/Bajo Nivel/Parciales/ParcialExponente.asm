
ORG 1000H
E db 3,2,1,5; valor via registro
B dw 2,2,3,2; ref via pila
tot db ?

ORG 3000H
POT:
    push bx
    push ax
    mov bx, sp
    add bx, 6
    mov bx, [bx]
    mov ah, [bx]; Valor de la base
    dec al; Valor del exponente - 1
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
mov ax, offset B
mov bx, offset E
mov dl, offset B - offset E
mov dh, 0
loop: cmp dl,0
      jz finprog
      push ax; ;Guardo la dir. tabla de bases que se envia via pila por ref
      mov al,[bx]; En al pongo el valor del exponente
      push bx
      CALL POT
      pop bx
      pop ax
      cmp ax,100
      jnz noinc
      inc dh
noinc:add ax,2
      inc bx
      sub dl,2
finprog: mov tot,dh
        HLT
END





