import java.util.Scanner;
public class test {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        String origen, tipoDeSubsidio;
        boolean sePuede;
        int cantidad;
        double costo;
        
        sePuede = false;
        System.out.println("Inserte un Origen:");
        origen = in.next().toUpperCase();
        while (!((origen.equals("FIN")) && sePuede)){
            System.out.println("Inserte una Cantidad:");
            cantidad = in.nextInt();
            System.out.println("Inserte un Costo:");
            costo = in.nextDouble();

            System.out.println("Inserte un Origen o 'FIN' para terminar:");
            System.out.println("Inserte Tipo de Subsidio:");
            tipoDeSubsidio = in.next().toUpperCase();
        }

        in.close();
    }
}