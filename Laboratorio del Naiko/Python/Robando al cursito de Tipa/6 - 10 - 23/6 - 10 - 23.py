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
	pass
def multiplicacion2(numero1, numero2):
	pass
def division(numero1, numero2):
	pass
def resta(numero1, numero2):
	pass

# -------------------------- PROGRAMA PRINCIPAL --------------------------
numero1 = int(input("Ingrese su numero: "))
numero2 = int(input("Ingrese su numero: "))

while(True):
	calcular = str(input("Que operacion quiere realizar: (suma, multi, div, resta, apagar)"))
	if calcular == "suma":
		print(numero1, "+", numero2, "=", suma(numero1, numero2))
	elif calcular == "multi":
		print(numero1, "*", numero2, "=", )
		print(numero1, "*", numero2, "=", )
	elif calcular == "div":
		print(numero1, "/", numero2, "=", )
	elif calcular == "resta":
		print(numero1, "-", numero2, "=", )
	elif calcular == "apagar":
		break
