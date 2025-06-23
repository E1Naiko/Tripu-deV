;  1) El siguiente programa produce la salida de un mensaje predefinido en la ventana Terminal del simulador
; WinMIPS64. Teniendo en cuenta las condiciones de control del puerto de E/S (en el resumen anterior), modifique el
; programa de modo que el mensaje a mostrar sea ingresado por teclado en lugar de ser un mensaje fijo.

.data
	CONTROL: .word32 0x10000
	DATA: .word32 0x10008
	TEXTO: .asciiz "" ; El mensaje a mostrar

.text
	lwu $s0, DATA(r0) 		; $s0 = dirección de DATA
	lwu $s1, CONTROL(r0) 	; $s1 = dirección de CONTROL
	daddi $t0, $0, 0 		; Actualizo codigos de lectura
	daddi $t1, $0, 0 		; Caracter actual
	daddi $t3, $0, 0 		; Dezplazamiento de cadena
	daddi $t4, $0, 0 	    ; Resultado de comparacion entre caracter y frenado "13"

	bucle:
		; Solicitar lectura de carácter (operación 9)
    	daddi $t0, $0, 9   	  ; Código para leer carácter
    	sd $t0, 0($s1)        ; Escribir en CONTROL
    	; Leer carácter desde DATA (ASCII en byte menos significativo)
    	lbu $t1, 0($s0)       ; Leer byte de DATA
    	
    	; Caracter <> 13 (enter)
    	daddi $t4, $t1, -13
		beqz $t4, finBucle
    	
    	sb $t1, TEXTO($t3)
    	daddi $t3, $t3, 1

    	j bucle

	finBucle: ; Imprimir Cadena de caracteres

	daddi $t0, $0, TEXTO 	; $t0 = dirección del mensaje a mostrar
	sd $t0, 0($s0) 			; DATA recibe el puntero al comienzo del mensaje
	daddi $t0, $0, 6 		; $t0 = 6 -> función 6: limpiar pantalla alfanumérica
	sd $t0, 0($s1) 			; CONTROL recibe 6 y limpia la pantalla
	daddi $t0, $0, 4 		; $t0 = 4 -> función 4: salida de una cadena ASCII
	sd $t0, 0($s1) 			; CONTROL recibe 4 y produce la salida del mensaje

halt