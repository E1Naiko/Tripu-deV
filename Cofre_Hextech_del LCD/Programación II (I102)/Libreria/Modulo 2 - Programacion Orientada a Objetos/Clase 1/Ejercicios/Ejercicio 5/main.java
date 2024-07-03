import java.util.Scanner;
/**
 * Write a description of class Programa here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class main
{
    /**
     * Método main
     * 
     */
    public static void main(String[] args)
    {
        //Paso 1: Declarar la variable vector de alturas
        double [] alturas;

        //Paso 2: Declarar indice y promedio (iniciarlo)
        int indice = 15;
        double promedio = 0;

        //Paso 3: Declarar y crear el scanner
        Scanner in = new Scanner(System.in);

        //Paso 4: Crear el vector para 15 valores
        alturas = new double[indice];

        //Paso 5: Ingresar 15 numeros, cargarlos en el vector, ir calculando la suma
        int i;
        double sumatoria = 0;
        for (i=0; i<indice; i++) {
            System.out.print("Ingrese la altura del jugador " + i + ":");
            alturas[i] = in.nextDouble();
            sumatoria = sumatoria + alturas[i];
        }

        //Paso 6: Calcular el promedio
        promedio = (double) sumatoria/indice;

        //Paso 7: Recorrer el vector, contar los números que son mayores que el promedio
        int cont = 0;
        for (i=0; i<indice; i++) if (alturas[i] > promedio) cont++;

        System.out.print("Altura Promedio: " + promedio);
        System.out.print("Cantidad de jugadores que superaron la altura promedio: " + cont);
        in.close();
    }
}
