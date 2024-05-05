import java.util.Scanner;
public class main {
    public static void main(String[] args) {
        Micros micro = new Micros("ABC123", "Mar del Plata", "5:00 am");

        // Cargar pasajeros
        Scanner scanner = new Scanner(System.in);
        int numeroAsiento;
        while (true) {
            System.out.print("Ingrese número de asiento (-1 para finalizar): ");
            numeroAsiento = scanner.nextInt();
            if (numeroAsiento == -1 || micro.microLleno()) {
                break;
            }
            if (micro.validarNumeroAsiento(numeroAsiento)) {
                if (!micro.devolverEstadoAsiento(numeroAsiento)) {
                    micro.ocuparAsiento(numeroAsiento);
                } else {
                    System.out.println("El asiento " + numeroAsiento + " está ocupado.");
                    int primerLibre = micro.devolverPrimerAsientoLibre();
                    if (primerLibre != -1) {
                        System.out.println("Primer asiento libre: " + primerLibre);
                    } else {
                        System.out.println("No hay asientos libres.");
                    }
                }
            } else {
                System.out.println("Número de asiento inválido.");
            }
        }

        System.out.println("Cantidad de asientos ocupados: " + micro.devCantidadAsientosOcupados());
    }
}