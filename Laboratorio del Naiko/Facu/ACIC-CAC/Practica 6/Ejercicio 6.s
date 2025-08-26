; 6) El siguiente programa produce una salida estableciendo el color de
; un punto de la pantalla gráfica (en la ventana Terminal del simulador
; WinMIPS64). Modifique el programa de modo que las coordenadas y color
; del punto sean ingresados por teclado.

; 	* Si se escribe en DATA un color expresado en RGB (usando 4 bytes para representarlo:
; un byte para cada componente de color e ignorando el valor del cuarto byte),
; en DATA+4 la coordenada Y, en DATA+5 la coordenada X y se escribe un 5 en CONTROL,
; se pintará con el color indicado un punto de la pantalla gráfica de la terminal,
; cuyas coordenadas están indicadas por X e Y. La pantalla gráfica cuenta con una
; resolución de 50x50 puntos, siendo (0, 0) las coordenadas del punto en la esquina
; inferior izquierda y (49, 49) las del punto en la esquina superior derecha.

; 	* Si se escribe un 8 en CONTROL, se permitirá ingresar en la terminal un número
; (entero o en punto flotante) y el valor del número ingresado estará disponible para ser leído en DATA.

.data
	color: .byte 0, 255, 0, 0 ; color: máximo rojo + máximo azul => magenta
	CONTROL: .word32 0x10000
	DATA: .word32 0x10008
.text
	lwu $s0, CONTROL(r0) ; $s6 = dirección de CONTROL
	lwu $s1, DATA(r0) ; $s7 = dirección de DATA
	
	jal limpiarTerminal

	jal leerPosicion
	daddi $a0, $v0, 0

	jal leerPosicion
	daddi $a1, $v0, 0

	jal limpiarTerminal
	jal limpiarPantallaGrafica
	
	jal imprimirColor
	nop
	nop
	nop
	j fin

limpiarTerminal:
	daddi $t0, $0, 6 ; $t0 = 6 -> función 6: limpiar terminal
	sd $t0, 0($s0) ; CONTROL recibe 7 y limpia la terminal

	jr $ra

limpiarPantallaGrafica:
	daddi $t0, $0, 7
	sd $t0, 0($s0)

	jr $ra

leerPosicion:
	leerPosicionBucle: ; IMPORTANTE
		daddi $t0, $0, 8
		sd $t0, 0($s0)
	
		lbu $t1, 0($s1) ; valor actual de data
	
		; >= 50 
		slti $t2, $t1, 50
		beqz $t2, leerPosicionBucle

		; <0
		slti $t2, $t1, 0
		bnez $t2, leerPosicionBucle

	dadd $v0, $t1, $0

	jr $ra

imprimirColor:
    lwu $t2, color(r0)    ; Cargar color verde
    sw $t2, 0($s1)        ; Escribir color en DATA (32 bits)
    
    sb $a0, 4($s1)        ; Escribir coordenada X
    sb $a1, 5($s1)        ; Escribir coordenada Y
    
    daddi $t0, $0, 5      ; Función 5: dibujar pixel
    sd $t0, 0($s0)        ; Ejecutar
    jr $ra

;imprimirColor:
;	lwu $t2, color($0)
;	sw $t2, 0($s1) ; cargo color
;	
;	sd $a0, 4($s1) ; cargo x ; ERROR SB
;	sd $a1, 5($s1) ; cargo y ; ERROR SB, 8($s1)
;	
;	daddi $t0, $0, 5
;	sd $s0, 0($t0)
;
;	jr $ra

fin: halt