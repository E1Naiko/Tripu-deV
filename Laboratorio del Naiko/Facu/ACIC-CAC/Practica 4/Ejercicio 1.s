; 1) Muchas instrucciones comunes en procesadores con arquitectura
;	CISC no forman parte del repertorio de instrucciones del MIPS64,
;	pero pueden implementarse haciendo uso de una única instrucción.
;	Evaluar las siguientes instrucciones, indicar qué tarea realizan
;	y cuál sería su equivalente en lenguaje assembly del x86.

; 	a) dadd r1, r2, r0 ; dadd rd, rf, rg - Suma rf con rg, dejando el resultado
;	   					 en rd (valores con signo)
;	   					 r1 = r2 + r0 = r2 + 0

; 	b) daddi r3, r0, 5 ; daddi rd, rf, N - Suma rf con el valor inmediato N, dejando
;	   					 el resultado en rd (valores con signo)
;	   					 r3 = r0 + 5 = 0 + 5

; 	c) dsub r4, r4, r4 ; dsub rd, rf, rg - Resta rg a rf, dejando el resultado en rd
;	   					 (valores con signo)
;	   					 r4 = r4 - r4 = 0

; 	d) daddi r5, r5, -1 ; daddi rd, rf, N - Suma rf con el valor inmediato N, dejando
;	   					 el resultado en rd (valores con signo)
;	   					 r5 = r5 + (-1) = r5 - 1

; 	e) xori r6, r6, 0xffffffffffffffff ; xori rd, rf, N - Realiza un XOR entre rf y
;	   					 el valor inmediato N (bit a bit), dejando el resultado en rd
;	   					 r6 = r6 xor 11111111111111111111111111111111

