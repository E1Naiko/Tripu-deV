import java.util.Scanner;
public class main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int actDNI, actEdad, actNumPartidos, actNumGoles, actPartidosGanados;
        double actSueldoBasico;
        String actNombre;

        // Manejo del Jugador
        /*
        System.out.println("Ingrese un Dni:");
        actDNI = in.nextInt();
        System.out.println("Ingrese un Nombre:");
        actNombre = in.next();
        System.out.println("Ingrese una Edad:");
        actEdad = in.nextInt();
        System.out.println("Ingrese un Sueldo Basico:");
        actSueldoBasico = in.nextDouble();
        System.out.println("Ingrese una Cantidad de Partidos Jugados:");
        actNumPartidos = in.nextInt();
        System.out.println("Ingrese una Cantidad de Goles Anotados:");
        actNumGoles = in.nextInt();
         */
        actDNI = getIntInput("Ingrese un Dni:", in);
        actNombre = getStringInput("Ingrese un Nombre:", in);
        actEdad = getIntInput("Ingrese una Edad:", in);
        actSueldoBasico = getDoubleInput("Ingrese un Sueldo Basico:", in);
        actNumPartidos = getIntInput("Ingrese una Cantidad de Partidos Jugados:", in);
        actNumGoles = getIntInput("Ingrese una Cantidad de Goles Anotados:", in);

        Empleados jugador = new Jugador(actDNI, actNombre, actEdad, actSueldoBasico,
                actNumPartidos, actNumGoles);

        // Manejo del Entrenador
        /*
        System.out.println("Ingrese un Dni:");
        actDNI = in.nextInt();
        System.out.println("Ingrese un Nombre:");
        actNombre = in.next();
        System.out.println("Ingrese una Edad:");
        actEdad = in.nextInt();
        System.out.println("Ingrese un Sueldo Basico:");
        actSueldoBasico = in.nextDouble();
        System.out.println("Ingrese una Cantidad de Partidos Ganados:");
        actPartidosGanados = in.nextInt();
         */

        actDNI = getIntInput("Ingrese un Dni:", in);
        actNombre = getStringInput("Ingrese un Nombre:", in);
        actEdad = getIntInput("Ingrese una Edad:", in);
        actSueldoBasico = getDoubleInput("Ingrese un Sueldo Basico:", in);
        actPartidosGanados = getIntInput("Ingrese una Cantidad de Partidos Ganados:", in);

        Empleados entrenador = new Entrenador(actDNI, actNombre, actEdad, actSueldoBasico,
                actPartidosGanados);

        System.out.println(jugador.toString());
        System.out.println(entrenador.toString());

        in.close();
    }
    // Método auxiliar para obtener un entero del usuario
    private static int getIntInput(String prompt, Scanner in) {
        System.out.println(prompt);
        return in.nextInt();
    }

    // Método auxiliar para obtener un double del usuario
    private static double getDoubleInput(String prompt, Scanner in) {
        System.out.println(prompt);
        return in.nextDouble();
    }

    // Método auxiliar para obtener una cadena del usuario
    private static String getStringInput(String prompt, Scanner in) {
        System.out.println(prompt);
        return in.next();
    }
}