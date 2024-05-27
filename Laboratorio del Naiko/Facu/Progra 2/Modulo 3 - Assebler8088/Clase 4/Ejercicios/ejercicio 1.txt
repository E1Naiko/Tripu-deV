;; CLASE DE REPASO Ejercicio 1:
;; a)	Implementen una subrutina reusable que logre realizar el
; procesamiento de la rutina en Pascal detallada a continuación.
; El pasaje de parámetros debe ser por pila. Consideren que los
; datos son de tipo byte y enteros positivos. 
;
; procedure rutina(var n: integer);
; var i, res: integer;
; begin
;   res:=0;
;   for i:=1 to n do
;     res:= res+i;
;   n:= res;
; end;

; b)	Implementen un programa en Assembler que invoque a la subrutina
; implementada en a) para aquellos valores de la tabla que sean menores
; a 20. Por ejemplo, si tenemos la siguiente tabla: 
	
; TablaA  1, 20, 5, 4, 30; 

; los valores finales serán: TablaA  1, 20, 15, 10, 30. 

; El programa también debe almacenar en memoria la cantidad de valores
; que fueron modificados, en el ejemplo anterior sería 3 (por los
; valores 1, 5 y 4).

org 1000h
tabla db 1, 20, 5, 4, 30
finTabla db ?
valoresModificados db 0
menorA db 20

org 3000h
  RUTINA:
    ; Guardo los valores pre subrutina de los registros
    push ax
    push bx
    push cx
    push dx

    ; cargo mi valor desde la pila
    mov bx, sp
    add bx, 10
    mov bx, [bx]

    ; Inicializo registros
    mov ax, 1 ; voy a usar a ax como variable i
    mov cx, 0 ; voy a usar a cx como variable res

    ; Estructura for
    for: cmp byte ptr [bx], al
      jz fin
      inc al
      add cl, al
      jmp for

    ; actualizo resultado
    fin: mov  byte ptr [bx], cl
    
    ; Restauro los valores pre subrutina de los registros
    pop dx
    pop cx
    pop bx
    pop ax
  ret

org 2000h
  mov bx, offset tabla; posicion actual de la tabla
  mov ax, offset finTabla - offset tabla ; voy a usar ax como contador
  mov dl, menorA

  ; Recorro toda la tabla 
  bucleMain: cmp ax, 0
    jz finMain ; si la cantidad de elementos en la tabla restantes es 0 termino
    dec ax

    ; comparo si mi valor actual es menor a 
    cmp byte ptr [bx], dl
      jns siguiente
      inc dl
    
      push bx

      call RUTINA
      pop bx

   siguiente: inc bx
   jmp bucleMain
  
  finMain: mov menorA, dl
  hlt
END
