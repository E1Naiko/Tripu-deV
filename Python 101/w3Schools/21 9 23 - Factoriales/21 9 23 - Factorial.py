"""
	2. 
		*a) El factorial de un número n se expresa como n! y se define como el producto de todos los
	números desde 1 hasta n. Por ejemplo, el factorial de 6 o 6! equivale a 6*5! que a 1*2*3*4*5*6 que
	equivale a 720. Escriba una función que reciba un número n y retorne su factorial.
		
		b) Un número combinatorio (m,n) expresa todas las combinaciones de m elementos agrupados de a
	n grupos. La expresión numérica de un número combinatorio es la siguiente:
	Utilizando la función factorial, escriba una función que calcule el número combinatorio (m, n).

"""
def imprimir(num):
	print('El Resultado es ', num)

## MODULOS NORMALES
def factorial(num):
	i = aux = int(1)
	if num == 0:
		return num
	else:
		while i <= num:
			aux *= i
			i += 1
		return aux
		
def combinatorio(m, n):
	aux = factorial(m) / (factorial(m - n) * factorial(n))
	return aux

## MODULOS RECURSIVOS (PONELE)
def factorialRecursivo(n):
	if n<=1:
		return 1
	else:
		return n * factorialRecursivo(n-1)
	
def combinatorioRecursivo(m, n):
	aux = factorialRecursivo(m) / (factorialRecursivo(m - n) * factorialRecursivo(n))
	return aux
	
	
## ---------------------- PROGRAMA PRINCIPAL ----------------------
act = int(input('INTRODUZCA UN NUMERO: '))
imprimir(factorial(act))
imprimir(factorialRecursivo(act))

m = int(input('INTRODUZCA UN NUMERO m: '))
n = int(input('INTRODUZCA UN NUMERO n: '))
imprimir(combinatorio(m,n))
imprimir(combinatorioRecursivo(m,n))
