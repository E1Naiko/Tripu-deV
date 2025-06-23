; 4) El índice de masa corporal (IMC) es una medida de asociación entre
;	el peso y la talla de un individuo. Se calcula a ; partir del peso
;	(expresado en kilogramos, por ejemplo: 75,7 kg) y la estatura
;	(expresada en metros, por ejemplo 1,73 m), usando la fórmula: IMC = peso / (estatura)^2
;
; 		De acuerdo al valor calculado con este índice, puede clasificarse el estado nutricional de
;	una persona en: Infrapeso (IMC ; < 18,5), Normal (18,5 ≤ IMC < 25),
;	Sobrepeso (25 ≤ IMC < 30) y Obeso (IMC ≥ 30).
;
; 		Escriba un programa que dado el peso y la estatura de una persona calcule su IMC y lo guarde
; 	en la dirección etiquetada IMC. También deberá guardar en la dirección etiquetada
; 	estado un valor según la siguiente tabla:
;
; 	  IMC   | Clasificación | Valor guardado
; --------------------------------------------
; 	< 18,5  |   Infrapeso   |       1
; 	 < 25   |     Normal    |       2
; 	 < 30   |   Sobrepeso   |       3
; 	 ≥ 30   |     Obeso     |       4

.data
	PESO: .double 121.5
	ESTATURA: .double 1.84
	ESTADO: .word 0
	TABLA: .double 18.5, 25.0, 30.0
	CANTTABLA: .word 3

.code
	l.d f1, PESO(r0)
	l.d f2, ESTATURA(r0)
	add.d f3, f0, f0 ; IMC
	add.d f4, f0, f0 ; Valor Actual de tabla

	mul.d f2, f2, f2
	daddi r1, r0, 0 ; resultado a guardar
	dadd r2, r0, r0 ; Dezplazamiento de la tabla

	; IMC = peso / (estatura)^2
	div.d f3, f1, f2

	BUCLE: l.d f4, TABLA(r2)
		daddi r1, r1, 1
		daddi r2, r2, 8

		c.lt.d f3, f4
		bc1f BUCLE
	FIN: sd r1, ESTADO(r0)
halt