; 5) Contador de vocales

; A. Escribir un programa que lea una cadena de 10 caracteres. Una
; vez leído completamente, el string se muestra en pantalla, y también
; se debe mostrar la cantidad de vocales que tiene el string. Para
; implementar este programa, utilizar una subrutina leer_str_n que
; recibe por parámetro la dirección donde se guardan los caracteres
; y la cantidad de caracteres a leer. Usar también la subrutina
; contar_voc de la práctica anterior.

; B. Idem A) pero ahora la longitud de la cadena no se conoce de
; antemano; se leen caracteres hasta que llega el caracter “.”
; (punto). Para ello, implementar la subrutina leer_str_car, que
; recibe el carácter de fin por parámetro y la dirección de comienzo
; donde se almacenarán los caracteres..

ORG 1000H
  VOCALES db "AEIOUaeiou"
  FIN_VOCALES db 0
  ESP db 10
  
  Cadena db "^^^^^^^^^^"
  FIn_Cadena db ?

  MSJ_CANT_VOC db "LA CANTIDAD DE VOCALES ES : "
  CANT_VOC_10 db 0
  CANT_VOC_1 db 0
  fin_MSJ db ?

ORG 1500H
  IN_CHAR db ?

ORG 3000h
; subrutina leer_str_n:
; recibe por parámetro la dirección donde se guardan los caracteres
; y la cantidad de caracteres a leer.
  leer_str_n:
    ; guardo copia de mis registros
    push dx
    push cx
    push bx
    push ax

    
    mov ah, 0 ; reservo ah para usar de contador
    mov dx, 0 ; reservo dx para usar de aux
    mov cx, bx ; uso a cx como almacenamiento temp de la direccion final

    ; bucle repeat until
    bucle_leer_str_n: mov bx, offset IN_CHAR ; cargo mi variable de carga
      int 6
      
      inc ah ; incremento contador de cantidad de caracteres
      ; cargo el valor leido
      mov bx, cx
      mov dl, IN_CHAR
      mov byte ptr [bx], dl
      inc cx ; incremento mi celda de memoria act
      
    cmp ah, al
    jnz bucle_leer_str_n

    ; recupero el estado de mis registros
    pop ax
    pop bx
    pop cx
    pop dx
    ret

  imprimir:
    push cx
    push dx
    mov cx, 0
    
    int 7
    push bx
    mov bx, offset ESP
    mov cl, al
    mov al, 1
    int 7

    pop bx
    mov al, cl

    pop dx
    pop cx
    ret

;	c) * Escriba la subrutina ES_VOCAL, que determina si un carácter es vocal o no, ya sea
;    mayúscula o minúscula. La rutina debe recibir el carácter por valor vía registro, y
;    debe retornar, también vía registro, el valor 0FFH si el carácter es una vocal, o 00H en
;    caso contrario.
;	Ejemplo: ES_VOCAL de ‘a’ o ‘A’ debe retornar 0FFh y ES_VOCAL de ‘b’ o de ‘4’ debe retornar 00h
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

ORG 2000H

  mov bx, offset Cadena
  mov al, offset Fin_Cadena - offset Cadena
  call leer_str_n

  mov bx, offset Cadena
  mov al, offset Fin_Cadena - offset Cadena
  
  call imprimir

  mov ax, 0
  mov cx, 0
  mov dx, 0
  mov dl, offset Fin_Cadena - offset Cadena
  
  bucle_CONT_VOCALES:
    mov al, byte ptr [bx]
    push bx
    mov bx, offset VOCALES
    call ES_VOCAL
    cmp ax, 0FFh
    jnz sig
    
    inc cl
    sig: pop bx
    inc bx
    inc dh
    
  cmp dh, dl
  jnz bucle_CONT_VOCALES

  cmp cl, 10
  jz todasvocales
  mov CANT_VOC_10, '0'
  add cl, '0'
  mov CANT_VOC_1, cl
  jmp fin_Main

  todasVocales: mov CANT_VOC_10, '1'
  mov CANT_VOC_1, '0'
  
  fin_Main:
  mov bx, offset MSJ_CANT_VOC
  mov al, offset fin_MSJ - offset MSJ_CANT_VOC
  int 7
  hlt
  END