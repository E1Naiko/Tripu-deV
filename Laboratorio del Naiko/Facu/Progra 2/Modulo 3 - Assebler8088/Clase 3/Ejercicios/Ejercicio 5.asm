; TP3 Ejercicio 5: Escriba la subrutina ES_VOCAL, que determina si un caracter
; es vocal o no. La rutina debe recibir el caracter por valor, y debe retornar,
; vía registro, el valor 0FFH si el caracter es una vocal, o 00H en caso contrario.

org 1000h
  caracter db 'i'
  vocales db 'a', 'e', 'i', 'o', 'u'
  finVocales db ?
  resultado dw ?

ORG 3000H
  ES_VOCAL:
;; --- Estructura while
         mov dl, [bx]; actualizo el valor actual de la tabla
         inc bx ; pos siguiente de la tabla
         dec cL ; actualiza los elementos restantes

         ; Comparo si el valor esta dentro de la tabla
         cmp al, dl
           jz SeEncontro

           ; Comparo si se llego al final de la tabla
           cmp cx, 0
             jz NoSeEncontro
             jmp ES_VOCAL

         ; Actualizo Resultados
         SeEncontro: mov dx, 00H
                     jmp fin
         NoSeEncontro: mov dx, 0FFH

         fin: 
    ret

org 2000h
  mov al, caracter
  mov bx, offset vocales ; guarda la direccion del inicio de la tabla
  mov cx, offset finVocales - offset vocales ; guarda la cantidad de elementos de la tabla
  mov dx, 0

  call ES_VOCAL

  mov resultado, dx
  hlt
end
