; 2) Escriba un programa que utilice sucesivamente dos subrutinas:
;
; 	La primera, denominada ingreso, debe solicitar el ingreso por teclado
; de un número entero (de un dígito), verificando que el valor ingresado
; realmente sea un dígito.
;
; 	La segunda, denominada muestra, deberá mostrar en la salida estándar
; del simulador (ventana Terminal) el valor del número ingresado
; expresado en letras (es decir, si se ingresa un ‘4’, deberá mostrar ‘CUATRO’).
; 
; 	Establezca el pasaje de parámetros entre subrutinas respetando las
; convenciones para el uso de los registros y minimice las detenciones
; del cauce (ejercicio similar al ejercicio 6 de Práctica 2).

.DATA
	CONTROL: .word32 0x10000
	DATA: .word32 0x10008
	NUMERO: .ASCIIZ ""
.TEXT
	daddi $t2, $0, 0 	  ; Uso t2 para guardar la comparacion de datos
	jal ingreso

	jal muestra
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

	muestra:

	finMuestra: jr $ra