; 3) Escriba un programa que realice la suma de dos números enteros
;	(de un dígito cada uno) utilizando dos subrutinas: La denominada
;	ingreso del ejercicio anterior (ingreso por teclado de un dígito
;	numérico) y otra denominada resultado, que muestre en la salida
;	estándar del simulador (ventana Terminal) el resultado numérico
;	de la suma de los dos números ingresados (ejercicio similar al
;	ejercicio 7 de Práctica 2).

.DATA
	CONTROL: .word32 0x10000
	DATA: .word32 0x10008
	NUMERO: .ASCIIZ ""

.TEXT
	jal ingreso
	
halt
	
	ingreso:
		; Solicitar lectura de carácter (operación 9)
    	daddi $t0, $0, 9   	  ; Código para leer carácter
    	sd $t0, 0($s1)        ; Escribir en CONTROL

    	; Leer carácter desde DATA (ASCII en byte menos significativo)
    	lbu $t1, 0($s0)       ; Leer byte de DATA

    	; Caracter < 0 (48 ASCII)
    	slti $t4, $t1, 48
		bnez $t4, finIngreso

		; Caracter < 9 (57 ASCII)
    	slti $t4, $t1, 58
		beqz $t4, finIngreso

		sd $t1, NUMERO($0)

	finIngreso: jr $ra