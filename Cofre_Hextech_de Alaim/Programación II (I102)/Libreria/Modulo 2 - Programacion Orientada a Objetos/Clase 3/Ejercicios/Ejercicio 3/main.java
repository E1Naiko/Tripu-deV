import java.util.Scanner;
public class main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        
        // Declaración de todas las variables al principio
        String nombre;
        double sueldoBasico;
        int cantCampeonatosGanados;
        Persona entrenador;

        System.out.println("Ingrese el nombre del entrenador:");
        nombre = in.nextLine();

        System.out.println("Ingrese el sueldo básico del entrenador:");
        sueldoBasico = in.nextDouble();

        System.out.println("Ingrese la cantidad de campeonatos ganados por el entrenador:");
        cantCampeonatosGanados = in.nextInt();

        // Crear una instancia de Persona
        entrenador = new Persona(nombre, sueldoBasico, cantCampeonatosGanados);

        // Prueba de los métodos
        System.out.println(entrenador.toString());
        System.out.println("Sueldo a cobrar: " + entrenador.calcularSueldoACobrar());        
        
        in.close();
    }
}