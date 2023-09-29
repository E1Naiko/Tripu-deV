"""
	EJERCICIO SALIDO DEL TP3 ADDICIONAL DE LOS EJERCICIOS DE PRACTICA DE LA
	CATEDRA DE PROGRAMACIÓN 1 DE LA UNLP
	
	consigna y notas en el archivo readme.me
"""
# ------------------------------- OBJETOS -------------------------------
class radar: # OBJETO RADAR
	def __init__(self, codigo, velocidadMaxima, cantidadVehiculos):
		self.codigo = str(input("Ingrese el código de radar: "))
		if self.codigo != "-1":
			self.velocidadMaxima = int(input("Ingrese la velocidad máxima permitida: "))
			self.cantidadVehiculos = int(input("Ingrese la cantidad de vehículos registrados: "))
		
	def devolverCodigo(self):
		return self.codigo
		
	def devolverVelMax(self):
		return self.velocidadMaxima
	
	def devolverCantVehi(self):
		return self.cantidadVehiculos
		
	def __str__(self):
		return f"Radar: {self.codigo}, Velocidad Maxima Permitida: {self.velocidadMaxima} km/h, Cantidad de Vehiculos Registrada: {self.cantidadVehiculos} vehiculos)."

class vehiculo: # OBJETO VEHICULO
	def __init__(self):
		self.patente: str(input("Ingrese la patente del vehiculo."))
		self.velocidad: int(input("Ingrese la velocidad registrada."))
	
	def __str__(self):
		return f"Vehiculo: {self.patente}, Velocidad alcanzada: {self.velocidad} km/h."

# ------------------------------- PROGRAMA PRINCIPAL -------------------------------
radarAct = radar
cod = radarAct.devolverCodigo
"""
while cod != "-1":
	i = int(1)
	cantVehi = radarAct.devolverCantVehi()
	while i < cantVehi:
		i += 1
	print(i)
"""
print(f"{radarAct.__str__}")
print(cod)
