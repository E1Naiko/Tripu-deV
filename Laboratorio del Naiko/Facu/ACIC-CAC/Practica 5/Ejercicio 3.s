; 3) Escribir un programa que calcule la superficie de un triángulo rectángulo
;	de base 5,85 cm y altura 13,47 cm. Pista: la superficie de un triángulo
;	se calcula como: Superficie = (base x altura) / 2

.data
	BASE: .double 5.85
	ALTURA: .double 13.47
	DOS: .double 2.0
	RES: .double 0.0

.code
	l.d f1, BASE(r0)
	l.d f2, ALTURA(r0)
	l.d f3, RES(r0)
	l.d f4, DOS(r0)

	mul.d f3, f1, f2
	div.d f3, f3, f4
	
	s.d f3, RES(r0)
	halt