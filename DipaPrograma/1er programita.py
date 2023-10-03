"""Realizar un programa que implemente y use:

a) un módulo que cargue un vector con 50 números enteros y lo retorne.

b) un módulo que reciba el vector generado en a) y retorne el promedio de sus valores y el
porcentaje de números negativos y positivos.

c) un módulo que reciba el vector generado en a) y dos valores enteros que representan un rango de
valores y que retorne la cantidad de elementos del vector que estén dentro de ese rango.

d) un módulo que reciba el vector generado en a) y retorne los dos valores máximos entre sus
elementos junto con la posición donde se encuentran."""

#------------------------- MODULOS -------------------------
"""1ro tenemos que tener un modulo que cargar los vectores con 50 numeros 
enteros
Para eso, tenemos que crear el vector primeramente y darle el valor
luego tenemos que ponerle el rango, que vaya de 1 a 50
una vez que el vector llegue a los 50 num enteros, este debe de retornar
agregamos un print"""
"""parametro, variable definida para esperar el valor o direccion de otro, son lo de adentro de los ()"""
def cargarVector(): 
    Vector = []
    for x in range(5):
        elemento = int(input("Cargar vector: "))
        Vector.append(elemento)
    return Vector
		
		

#------------------------- PROGRAMA PRINCIPAL -------------------------
Vector = cargarVector()
print(f"cargarVector: {Vector}")

