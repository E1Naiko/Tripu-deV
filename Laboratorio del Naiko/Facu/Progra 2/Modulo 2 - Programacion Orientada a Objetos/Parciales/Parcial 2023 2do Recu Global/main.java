import java.util.Scanner;
public class main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        // Arreglo de Subsidios, pueden tomar todos los casos
        int MAXSUBSIDIOS = 1;
        Subsidio [] vecSubsidios = new Subsidio[MAXSUBSIDIOS];
        DeBienes auxDeBienes;
        // DeEstadia auxDeEstadia;

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
        boolean sePuede, subsidioEnSist;

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
            subsidioEnSist = false;
            while (!subsidioEnSist){
                System.out.println("Inserte Tipo de Subsidio:");
                tipoDeSubsidio = in.next().toUpperCase();
                if (tipoDeSubsidio.equals("DEESTADIA")){
                    subsidioEnSist = true;

                    // Lectura DeEstadia
                    System.out.println("Inserte Lugar de Destino:");
                    lugarDeDestino = in.next();
                    tipoDeTraslado = in.next().toUpperCase();
                    while (!((tipoDeTraslado.equals("AVION")) || (tipoDeTraslado.equals("MICRO")))){
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
                else if (tipoDeSubsidio.equals("DEBIENES")){
                    subsidioEnSist = true;
                    sePuede = false;

                    // Inicializo el Objeto
                    auxDeBienes = new DeBienes(nombrePlanTrabajo, diaSolicitud, mesSolicitud,
                        añoSolicitud, cuit, nombre, apellido);

                    System.out.println("Inserte un Origen:");
                    origen = in.next().toUpperCase();
                    while (!((origen.equals("FIN")) && sePuede)){
                        System.out.println("Inserte una Cantidad:");
                        cantidad = in.nextInt();
                        System.out.println("Inserte un Costo:");
                        costo = in.nextDouble();

                        sePuede = auxDeBienes.sePuedeInsertar();
                        if (sePuede){
                            auxDeBienes.insertarBien(origen, cantidad, costo);
                        }

                        System.out.println("Inserte un Origen o 'FIN' para terminar:");
                        System.out.println("Inserte Tipo de Subsidio:");
                        tipoDeSubsidio = in.next().toUpperCase();
                    }
                    vecSubsidios[i] = auxDeBienes;
                    i++;
                }
                else {
                    System.out.println("ERROR - Tipo de Subsidio no encontrado.");
                }
            }
        }

        in.close();
    }
}