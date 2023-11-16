"""
	EJERCICIO SALIDO DEL TP3 ADDICIONAL DE LOS EJERCICIOS DE PRACTICA DE LA
	CATEDRA DE PROGRAMACIÓN 1 DE LA UNLP
	
	consigna y notas en el archivo readme.me
"""
# ------------------------------- CONSTANTESn't -------------------------------
FIN = "-1"
# ------------------------------- OBJETOS -------------------------------
# no se por que, pero parece importante poner la primer letra del objeto con mayus, supongo que es nomenclatura

class ObjRadar: # OBJETO RADAR
	def __init__(self, codigo, velocidadMaxima, cantidadVehiculos):
		self.codigo = codigo
		self.velocidadMaxima = velocidadMaxima
		self.cantidadVehiculos = cantidadVehiculos
		
	def __str__(self):
		return f"Radar: {self.codigo}, Velocidad Maxima Permitida: {self.velocidadMaxima} km/h, Cantidad de Vehiculos Registrada: {self.cantidadVehiculos} vehiculos)."

class ObjVehiculo: # OBJETO VEHICULO
	def __init__(self, patente, velocidad):
		self.patente = patente
		self.velocidad = velocidad
	
	def __str__(self):
		return f"Vehiculo: {self.patente}, Velocidad alcanzada: {self.velocidad} km/h."

# ------------------------------- MODULOS -------------------------------
def leerRadar(): # INICIALIZA RADAR
	print("--------------------------------------------------------------------------")
	auxCod = str(input("Introduzca el codigo del radar Actual: "))
	if auxCod != FIN:
		auxVelMax = int(input("Introduzca la velocidad maxima admitida por el radar: "))
		auxCantVehi = int(input("Introduzca la cantidad de vehiculos registrada en el radar: "))
		radar = ObjRadar(auxCod, auxVelMax, auxCantVehi)
		return radar
	else:
		radar = ObjRadar(auxCod, 0, 0)
		return radar
		
def leerVehiculo(num):
	auxPatente = str(input(f"Introduzca la patente del vehiculo {num}:"))
	auxVelocidad = int(input(f"Introduzca la velocidad del vehiculo {num}:"))
	vehi = ObjVehiculo(auxPatente, auxVelocidad)
	return vehi

def recorrerRadar(actRadar):
	# inicializo variables locales
	i = sumatoria = multados = int(0)
	mayor = ["ERROR -  DATO NO CARGADO", -1]
	menor = ["ERROR -  DATO NO CARGADO", 9999]
	
	# recorrido
	while i < actRadar.cantidadVehiculos:
		i += 1
		vehiAct = leerVehiculo(i)
		sumatoria += vehiAct.velocidad
		if vehiAct.velocidad > actRadar.velocidadMaxima:
			multados += 1
		if vehiAct.velocidad < menor[1]:
			menor = [vehiAct.patente, vehiAct.velocidad]
		if vehiAct.velocidad > mayor[1]:
			mayor = [vehiAct.patente, vehiAct.velocidad]
		
	# calculo y vuelta
	prom = sumatoria / actRadar.cantidadVehiculos
	resultado = [prom, multados, mayor[0], menor[0]] # LISTA CON RESULTADOS
	return resultado
	
def imprimirDatos(datosAct):
	print("--------------------------------------------------------------------------")
	print(f" - Velocidad promedio: {datosAct[0]} km/h, vehiculos multados: {datosAct[1]}")
	print(f" - Patente del vehiculo que alcanzo mayor velocidad: {datosAct[2]}")
	print(f" - Patente del vehiculo que alcanzo menor velocidad: {datosAct[3]}")
	print("--------------------------------------------------------------------------")

# ------------------------------- PROGRAMA PRINCIPAL -------------------------------
# INICIALIZO
datosAct = list()

# MAIN
actRadar = leerRadar()
while actRadar.codigo != FIN:
	datosAct = recorrerRadar(actRadar)
	imprimirDatos(datosAct)
		
	actRadar = leerRadar() # ACA SI NECESITA LOS ()
print("FINALIZANDO PROGRAMA")
