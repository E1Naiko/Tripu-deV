"""
		8- Se lee información relativa al stock de 500 productos de una tienda de venta en-línea. Informar los
	códigos de los 2 productos que tienen menor stock. Además, para el producto con mayor stock de la
	tienda, se debe informar el número de producto y su respectivo stock. 
"""
## CONST
##constTotal = int(2)

## --------------------------------- MODULES ---------------------------------
def imprimirRes(mayor, mayorNum, menor1, menor2):
	print("PRODUCTO QUE MAS VENDIO: ", mayorNum, ", CON ", mayor, " VENTAS")
	print("1er MENOR: " + format(menor1))
	print("2d0 MENOR: " + format(menor2))

def leerProductos(mayor, mayorNum, menor1, menor2): ## lee información relativa al stock de <constTotal> productos
	i = 0
	while i < 5:
		x = int(input("Introduzca el stock del elemento numero: "))
		
		if x > mayor:
			mayor = x
			mayorNum = i
			
		if x < menor1:
			menor2 = menor1
			menor1 = x
		elif x < menor2:
			menor2 = x
			
		i += 1
	imprimirRes(mayor, mayorNum, menor1, menor2)
	
				
## --------------------------------- MAIN ---------------------------------		
## INICIALIZO
menor1 = int(9999)
menor2 = int(9998)
mayor = int(0)
mayorNum = int(0)

## MAIN
leerProductos(mayor, mayorNum, menor1, menor2)

