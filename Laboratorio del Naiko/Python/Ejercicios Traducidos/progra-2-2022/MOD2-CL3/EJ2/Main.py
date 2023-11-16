"""
2- A – Definir una clase para representar balanzas comerciales (para ser utilizadas en verdulerías, carnicerías, etc).
Una balanza comercial sólo mantiene el monto y la cantidad de items correspondientes a la compra actual
(es decir, no almacena los ítems de la compra). La balanza debe responder a los siguientes mensajes: 

iniciarCompra(): inicializa el monto y cantidad de ítems de la compra actual. 

registrarProducto(pesoEnKg, precioPorKg): recibe el peso en kg del ítem comprado y su precio por kg,
debiendo  realizar las actualizaciones en el estado de la balanza. 

devolverMontoAPagar(): retorna el monto de la compra actual. 

devolverResumenDeCompra(): retorna un String del siguiente estilo “Total a pagar X por la
compra de Y productos” , donde X es el monto e Y es la cantidad de ítems de la compra. 


B - Genere un programa principal que cree una balanza e inicie una compra. Lea información desde
teclado correspondiente a los ítems comprados (peso en kg y precio por kg) hasta que se ingresa uno con peso 0.
Registre cada producto en la balanza. Al finalizar, informe el resumen de la compra. 

"""

#------------------------------- CONSTANTES -------------------------------
CORTAR = 0
#------------------------------- OBJETOS -------------------------------
from BalanzaComercial import BalanzaComercial
	
#------------------------------- PROGRAMA PRINCIPAL -------------------------------
balanza = BalanzaComercial()
ok = True
precioPorKg = int(input("Ingrese el peso del producto: "))
while ok:
	pesoEnKg = int(input("Ingrese el precio por kg del producto: "))
	balanza.registrarProducto(pesoEnKg, precioPorKg)
	print("Monto Actual ", balanza.devolverMontoAPagar())
	
	peso = int(input("Ingrese el peso del producto: "))
	ok = (peso != CORTAR)

print(balanza.devolverResumenDeCompra())
