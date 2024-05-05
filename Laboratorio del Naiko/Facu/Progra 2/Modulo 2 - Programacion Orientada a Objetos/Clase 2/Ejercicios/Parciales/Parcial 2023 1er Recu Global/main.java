import java.util.Scanner;
public class main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        // Atributos de compra
        int codigoCompra, fechaDia, fechaMes, fechaAnio;

        // Atributos de Cliente
        int cuit, nCompras;
        String nombreCliente, apellidoCliente, metodoPago;
        boolean esJubiladoPensionado;

        // Atributos generales de Producto
        int codigoProducto, cantUnidadesAdquiridas;
        String nombreProducto, marca;
        double precioXUnidad;

        // Atributos para ProductoCA
        boolean formanParte;

        // Atributos para ProductoFueraCA
        String origen;

        // Objeto Cargado Final
        objCompra compra;

        // Auxiliares
        int i, auxTipoProducto;
        objProductoCA auxProductoCA;
        objProductoFueraCA auxProductoFueraCA;

        // --------------------------------- Main ---------------------------------
        // carga de Compra
        System.out.println("Ingrese Codigo de Compra:");
        codigoCompra = in.nextInt();
        System.out.println("Ingrese Dia de la Compra:");
        fechaDia = in.nextInt();
        System.out.println("Ingrese Mes de la Compra:");
        fechaMes = in.nextInt();
        System.out.println("Ingrese Año de la Compra:");
        fechaAnio = in.nextInt();

        // carga Cliente
        System.out.println("Ingrese CUIT del cliente:");
        cuit = in.nextInt();
        System.out.println("Ingrese la Cantidad de Compras:");
        nCompras = in.nextInt();
        System.out.println("Ingrese el Nombre del Cliente:");
        nombreCliente = in.next();
        System.out.println("Ingrese el Apellido del Cliente:");
        apellidoCliente = in.next();
        System.out.println("Ingrese el Metodo de Pago Elegido:");
        metodoPago = in.next().toUpperCase();

        while (!(metodoPago.equals("DEBITO") || metodoPago.equals("CREDITO"))){
            System.out.println("ERROR - Metodo Invalido, solo se admite Credito o Debito!");
            System.out.println("Ingrese el Metodo de Pago Elegido:");
            metodoPago = in.next().toUpperCase();
        }

        /* como el programa requiere que el cliente sea jubilado, pensionado o no, tomo "jubilado o pensionado"
        como valor true y "no" como false */
        System.out.println("Ingrese si el Cliente es Jubilado y/o Pensionado (true o false):");
        esJubiladoPensionado = in.nextBoolean();

        // carga del Objeto
        compra = new objCompra(codigoCompra, fechaDia, fechaMes, fechaAnio, cuit, nombreCliente, apellidoCliente, metodoPago, esJubiladoPensionado,
        nCompras);

        // carga de Productos
        i=0;
        while (i<nCompras){
            System.out.println(" - Ingrese el Codigo del Producto:");
            codigoProducto = in.nextInt();
            System.out.println(" --- Ingrese la Cantidad de Unidades Adquiridas:");
            cantUnidadesAdquiridas = in.nextInt();
            System.out.println(" --- Ingrese el Nombre del Producto:");
            nombreProducto = in.next();
            System.out.println(" --- Ingrese la Marca del Producto:");
            marca = in.next();
            System.out.println(" --- Ingrese el Precio Por Unidad:");
            precioXUnidad = in.nextDouble();

            System.out.println("Ingrese Tipo de producto(0 para Canasta Basica o 1 para Fuera de Canasta Basica):");
            auxTipoProducto = in.nextInt();
            if (auxTipoProducto == 0){ // PRODUCTO DE LA CANASTA BASICA
                System.out.println("Ingrese si el Producto Forma Parte del Programa Compra Sin IVA:");
                formanParte = in.nextBoolean();

                auxProductoCA = new objProductoCA(codigoProducto, nombreProducto, marca, precioXUnidad,
                    cantUnidadesAdquiridas, formanParte);

                compra.insertarAlVector(auxProductoCA);
                i++;
            }
            else if (auxTipoProducto == 1){ // PRODUCTO FUERA DE LA CANASTA BASICA
                System.out.println("Ingrese el Origen Del Producto:");
                origen = in.next();

                auxProductoFueraCA = new objProductoFueraCA(codigoProducto, nombreProducto, marca, precioXUnidad,
                    cantUnidadesAdquiridas, origen);

                compra.insertarAlVector(auxProductoFueraCA);
                i++;
            }
        }

        System.out.println(compra.toString());
        // --------------------------------- Informe ---------------------------------

        in.close();
    }
}