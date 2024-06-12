org 1000h
  TablaA db 1,20,5,4,30
  finTablaA db ?
org 3000h
  rutina:
    push ax
    push bx

    mov bx, sp
    add bx, 6
    mov bx, [bx]

    mov ah, 0 ; res
    mov al, 1 ; i
    bucleRutina: 
      add ah, al ; res+i
      inc al ; i+1
      cmp byte ptr [bx], al
      jns bucleRutina
      
    mov byte ptr [bx], ah
    
    pop bx
    pop ax
  ret
org 2000h
  mov al, 20
  mov bx, offset TablaA
  mov cx, offset finTablaA

  bucle: cmp bx, cx
    jz finBucle

    cmp byte ptr [bx], al
    jns mayor
    push bx
    call rutina
    pop bx
    
    mayor:
    inc bx
    jmp bucle
    
  finBucle:
  
  hlt
end