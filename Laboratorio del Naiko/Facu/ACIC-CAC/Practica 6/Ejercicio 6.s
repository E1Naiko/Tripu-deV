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
	coorX: .byte 24 ; coordenada X de un punto
	coorY: .byte 24 ; coordenada Y de un punto
	color: .byte 255, 1, 255, 1 ; color: máximo rojo + máximo azul => magenta
	CONTROL: .word32 0x10000
	DATA: .word32 0x10008
.text
	lwu $s6, CONTROL(r0) ; $s6 = dirección de CONTROL
	lwu $s7, DATA(r0) ; $s7 = dirección de DATA
	daddi $t0, $0, 7 ; $t0 = 7 -> función 7: limpiar pantalla gráfica
	sd $t0, 0($s6) ; CONTROL recibe 7 y limpia la pantalla gráfica
	lbu $s0, coorX(r0) ; $s0 = valor de coordenada X
	sb $s0, 5($s7) ; DATA+5 recibe el valor de coordenada X
	lbu $s1, coorY(r0) ; $s1 = valor de coordenada Y
	sb $s1, 4($s7) ; DATA+4 recibe el valor de coordenada Y
	lwu $s2, color(r0) ; $s2 = valor de color a pintar
	sw $s2, 0($s7) ; DATA recibe el valor del color a pintar
	daddi $t0, $0, 5 ; $t0 = 5 -> función 5: salida gráfica
	sd $t0, 0($s6) ; CONTROL recibe 5 y produce el dibujo del punto
halt