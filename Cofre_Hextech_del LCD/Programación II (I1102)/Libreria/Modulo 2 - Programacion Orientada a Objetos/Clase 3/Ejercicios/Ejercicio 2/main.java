import java.util.Scanner;
public class main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int FIN = 0;
        Balanza objBalanza;
        double actPeso, actPrecio;

        objBalanza = new Balanza();
        objBalanza.iniciarCompra();

        if (objBalanza.iniciadaConExito()) {
            System.out.println("Balanza iniciada con exito");
        }
        else {
            System.out.println("ERROR - Balanza no iniciada");
        }

        System.out.println("Ingrese el primer Peso");
        actPeso = in.nextDouble();
        while (actPeso != FIN) {
            System.out.println("Ingrese el precio por Kg:");
            actPrecio = in.nextDouble();
            
            objBalanza.registrarProducto(actPeso, actPrecio);

            System.out.println("Ingrese el siguiente Peso o " + FIN + " para terminar:");
            actPeso = in.nextDouble();
        }
        
        System.out.println(objBalanza.devolverResumenDeCompra());
        in.close();
    }
}