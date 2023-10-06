# BalanzaComercial.py

class BalanzaComercial:
    def __init__(self):
        # Inicializa el monto y la cantidad de productos de la compra actual.
        self.monto = 0
        self.cantProductos = 0

    def registrarProducto(self, pesoEnKg, precioPorKg):
        # Recibe el peso en kg del ítem comprado y su precio por kg,
        # realizando las actualizaciones en el estado de la balanza.
        self.monto += pesoEnKg * precioPorKg
        self.cantProductos += 1

    def devolverMontoAPagar(self):
        # Retorna el monto de la compra actual.
        return self.monto

    def devolverResumenDeCompra(self):
        # Retorna un string del siguiente estilo "Total a pagar X por la compra de Y productos",
        # donde X es el monto e Y es la cantidad de ítems de la compra.
        return f"Total a pagar ${self.monto} por la compra de {self.cantProductos} productos"
