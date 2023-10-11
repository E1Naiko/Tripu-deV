"""
	a) Escriba un módulo que reciba un carácter que debe ser un operador matemático ('*', '+', '-', '/') y
	dos números enteros, y devuelva el resultado de realizar la operación matemática entre los dos
	números recibidos. En caso de que el carácter no sea uno de los operadores matemáticos
	indicados, el módulo debe devolver el valor -1.
	
	b) Utilizando el módulo implementado en a), implemente un programa que lea el operador y los dos
	operandos, e imprima el resultado de dicha operación.
"""
# -------------------------- MODULOS --------------------------
def suma(numero1, numero2):
	res = numero1 + numero2
	return res

def multiplicacion(numero1, numero2):
	res2 = numero1 * numero2
	return res2
	
def multiplicacion2(numero1, numero2):
	resultado = 0
	for i in range(numero2):
		resultado += numero1
	return resultado
	
def division(numero1, numero2):
	res3 = numero1 / numero2
	return res3
	
def division2(numero1, numero2):
	"""lo que tenemos que hacer: si en la multiplicacion lo que hicimos fue ir sumando constantemente el numero hasta el resultado,
	ahora debemos de restarlo, como lo  hacemos, ni puta idea, pero algo se me va a ocurrir :) 
	definimos nuestra variable para que el numero empiece de 0, lo que tenemos que hacer es que el numero pase a ser = a numero1
	para que a numero1 se le reste numero2 hasta que el resto sea menor a numero2, una vez que el resto sea menor al numero2
	resultado = a la cantidad de veces que se resto numero2""" 
	while(True):
		resultado2 = 0
		if resultado2 > numero2
			numero1 - numero2
			
		else resultado2 < numero2
			print(resultado2)
	return resultado2
	
def resta(numero1, numero2):
	res4 = numero1 - numero2
	return res4

# -------------------------- PROGRAMA PRINCIPAL --------------------------
numero1 = int(input("Ingrese su numero: "))
numero2 = int(input("Ingrese su numero: "))

while(True):
	calcular = str(input("Que operacion quiere realizar: (suma, multi, div, resta, apagar): "))
	if calcular == "suma":
		print(numero1, "+", numero2, "=", suma(numero1, numero2))
	elif calcular == "multi":
		print(numero1, "*", numero2, "=", multiplicacion(numero1, numero2))
		print(numero1, "*", numero2, "=", multiplicacion2(numero1, numero2))
	elif calcular == "div":
		print(numero1, "/", numero2, "=", division(numero1, numero2))
		print(numero1, "/", numero2, "=", division2(numero1, numero2))
	elif calcular == "resta":
		print(numero1, "-", numero2, "=", resta(numero1, numero2))
	elif calcular == "apagar":
		break
