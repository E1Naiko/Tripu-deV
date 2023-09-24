"""

	7.
		* a) Escriba un procedimiento que lea la edad de una cantidad de personas y devuelva el promedio
	de estas. La cantidad de personas se recibe como parámetro.
		b) Escriba un programa que procese la edad de 25 personas utilizando el módulo desarrollado en a)
	e informe el resultado.
	
	ESTA CALCULANDO MAL

"""

# --------------------------------- INTENTO NICO ---------------------------------
def promediar(cantTotal):
	# INICIALIZO
	i = int(1)
	prom = int(0)
	
	## LEO Y SUMO TODAS LAS EDADES
	aux = "Introduzca la edad de la persona " + format(i) + " de " + format(cantTotal) + ": "
	act = int(input(aux))
	
	# PROCESO CADA NUM
	while (i<cantTotal):
		prom += act
		i += 1
		
		aux = "Introduzca la edad de la persona " + format(i) + " de " + format(cantTotal) + ": "
		act = int(input(aux))
	
	## CALCULO	
	prom /= cantTotal
	return prom
	
def promediarIntento2(totalPersonas):
	sumaEdades = int(0)
	
	for i in range(totalPersonas):
		try:
			edad = int(input(f"Introduzca la edad {i + 1}: "))
			sumaEdades += edad
		except ValueError:
			edad = int(input(f"ERROR, valor no valido, introduzca la edad {i+1}: "))
			
	if totalPersonas == 0:
		print("No se puede calcular el promedio con 0 personas.") 
	else:
		promedio = sumaEdades / totalPersonas
		print(f"Promedio de las", totalPersonas, "personas es: ", promedio);
	
# --------------------------------- MODULO GPT ---------------------------------
	
def calcularPromedioEdades(cantidad_personas):
	"""
	
			Este procedimiento primero solicita la cantidad de personas como entrada
		y luego utiliza un bucle for para pedir la edad de cada persona.
		
			Se suman todas las edades ingresadas y, finalmente, se calcula el promedio
		dividiendo la suma de edades por la cantidad de personas.
		
			Si se ingresa un valor no válido (por ejemplo, una edad que no sea un número entero),
		se maneja con una excepción ValueError.
		
	"""
	suma_edades = 0
	
	# aca usa un for, no lo se usar
	for i in range(cantidad_personas):
		try:
			edad = int(input(f"Ingrese la edad de la persona {i + 1}: ")) # ACTUALIZA i DENTRO DEL INPUT???? ES LEGAL ESO????
			suma_edades += edad
		except ValueError:
			print("Ingrese una edad válida como un número entero.")
	
	# compara si se leyeron personas o solo lo baitearon
	if cantidad_personas > 0:
		promedio = suma_edades / cantidad_personas
		# ACA USA F, supongo que para decirle a python que lo que esta entre llaves, imprima su valor
		print(f"El promedio de edades es: {promedio}")
	else:
		# ACA NO USA F, solo imprime no necesita variables, creo
		print("No se puede calcular el promedio con 0 personas.")

# --------------------------------- MAIN ---------------------------------
cantidadPersonas = int(input("Ingrese la cantidad de personas: "))

print("INTENTO 1:")
print("Resultado", promediar(cantidadPersonas))
print("INTENTO 2:")
promediarIntento2(cantidadPersonas)

# Ejemplo de uso
print("GPT:")
calcularPromedioEdades(cantidadPersonas)
