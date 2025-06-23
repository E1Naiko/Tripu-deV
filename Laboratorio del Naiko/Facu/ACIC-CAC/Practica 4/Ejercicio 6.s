; 6) Escribir un programa que lea tres números enteros A, B y C de la memoria
;	de datos y determine cuántos de ellos son iguales entre sí (0, 2 o 3).
;	El resultado debe quedar almacenado en la dirección de memoria D.

.data
	A: .word 2
	B: .word 2
	C: .word 3
	D: .word 0
.code
	dadd r5, r0, r0
	ld r1, A(r0)
	ld r2, B(r0)
	ld r3, C(r0)
	ld r4, D(r0)

	dsub r5, r1, r2
	bnez r5, sigue1
	daddi r4, r4, 1

sigue1: dsub r5, r2, r3
	bnez r5, sigue2
	daddi r4, r4, 1

sigue2: dsub r5, r1, r3
	bnez r5, sigue3
	daddi r4, r4, 1

sigue3: dsub r5, r1, r2
	bnez r5, fin
	daddi r4, r4, 1

fin: sd r4, D(r0)

halt