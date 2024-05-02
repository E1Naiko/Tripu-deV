import java.util.Scanner;
public class main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        // Arreglo de Subsidios, pueden tomar todos los casos
        int MAXSUBSIDIOS = 4;
        Subsidio [] vecSubsidios = new Subsidio[MAXSUBSIDIOS];

        // -------- Variables para carga --------
        // Para Subsidio
        String nombrePlanTrabajo, mesSolicitud;
        int diaSolicitud, añoSolicitud;

        // Para Investigador
        int cuit;
        String nombre, apellido;

        // Caso Subsidio de Estadia
        String lugarDeDestino, tipoDeTraslado;
        double costoPasajes, montoHotelXDia;
        int cantDiasEstadia;

        // Caso Subsidio de Bienes
        String origen;
        int cantidad;
        double costo;

        // Auxiliares
        String tipoDeSubsidio;
        boolean sePuede;

        // Programa Principal
        int i = 0;
        while (i < MAXSUBSIDIOS){
            System.out.println("Inserte Nombre del Plan de Trabajo:");
            nombrePlanTrabajo = in.next();

            // Lectura del subsidio
            System.out.println("Inserte Dia de la Solicitud:");
            diaSolicitud = in.nextInt();
            System.out.println("Inserte Mes de la Solicitud:");
            mesSolicitud = in.next();
            System.out.println("Inserte Año de la Solicitud:");
            añoSolicitud = in.nextInt();
            System.out.println("Inserte CUIT del Investigador:");
            cuit = in.nextInt();
            System.out.println("Inserte Nombre del Investigador:");
            nombre = in.next();
            System.out.println("Inserte Apellido del Investigador:");
            apellido = in.next();

            // Diferenciacion de subsidios
            System.out.println("Inserte Tipo de Subsidio:");
            tipoDeSubsidio = in.next();
            if (tipoDeSubsidio.toUpperCase().equals("DEESTADIA")){

                // Lectura DeEstadia
                System.out.println("Inserte Lugar de Destino:");
                lugarDeDestino = in.next();
                System.out.println("Inserte Tipo de Traslado (Avion o Micro):");
                tipoDeTraslado = in.next();
                while ((!tipoDeTraslado.toUpperCase().equals("AVION")) &&
                (!tipoDeTraslado.toUpperCase().equals("MICRO"))){
                    System.out.println("ERROR - Inserte Tipo de Traslado (Avion o Micro):");
                    tipoDeTraslado = in.next();
                }
                System.out.println("Inserte Costo de los Pasajes:");
                costoPasajes = in.nextDouble();
                System.out.println("Inserte Cantidad de Dias de Estadia:");
                cantDiasEstadia = in.nextInt();
                System.out.println("Inserte Monto del Hotel por Dia:");
                montoHotelXDia = in.nextDouble();

                // Carga del Objeto
                vecSubsidios[i]= new DeEstadia(nombrePlanTrabajo, diaSolicitud, mesSolicitud,
                    añoSolicitud, cuit, nombre, apellido, lugarDeDestino,
                    tipoDeTraslado, costoPasajes, cantDiasEstadia, montoHotelXDia);

                i++;
            }
            else if (tipoDeSubsidio.toUpperCase().equals("DEBIENES")){
                // Inicializo el Objeto
                vecSubsidios[i] = new DeBienes(nombrePlanTrabajo, diaSolicitud, mesSolicitud,
                    añoSolicitud, cuit, nombre, apellido);

                System.out.println("Inserte un Origen:");
                origen = in.next();
                while (!origen.toUpperCase().equals("FIN")){
                    System.out.println("Inserte una Cantidad:");
                    cantidad = in.nextInt();
                    System.out.println("Inserte un Costo:");
                    costo = in.nextDouble();
                    
                    // ------------------------- PREGUNTAR -----------------------------
                    sePuede = vecSubsidios[i].sePuedeInsertar();
                    if (sePuede){
                        
                    }
                    vecSubsidios[i].insertarBien(origen, cantidad, costo);
                    
                    System.out.println("Inserte un Origen o 'FIN' para terminar:");
                    origen = in.next();
                }
                i++;
            }
            else {
                System.out.println("ERROR - Tipo de Subsidio no encontrado.");
            }
        }

        in.close();
    }
}