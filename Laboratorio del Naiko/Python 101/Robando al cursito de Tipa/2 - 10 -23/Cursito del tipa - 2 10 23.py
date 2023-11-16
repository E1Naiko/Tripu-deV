"""

	1. * Realizar un programa que implemente y use:
	
	a) un módulo que cargue un vector con 50 números enteros y lo retorne.
	
	b) un módulo que reciba el vector generado en a) y retorne el promedio de sus valores y el
	porcentaje de números negativos y positivos.
	
	c) un módulo que reciba el vector generado en a) y dos valores enteros que representan un rango de
	valores y que retorne la cantidad de elementos del vector que estén dentro de ese rango.
	
	d) un módulo que reciba el vector generado en a) y retorne los dos valores máximos entre sus
	elementos junto con la posición donde se encuentran.

"""
# ------------------------- MODULOS -------------------------
def cargarVector():
	v = []
	i=0
	for i in range(5):
		aux = input("TUTUNGA: ")
		v.append(aux)
	return v
	
# ------------------------- PROGRAMA PRINCIPAL -------------------------
print(cargarVector())
