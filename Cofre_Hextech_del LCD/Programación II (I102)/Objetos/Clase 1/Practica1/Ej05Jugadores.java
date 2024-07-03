
/**
 * Write a description of class Programa here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import java.util.Scanner;
public class Ej05Jugadores
{
    /**
     * Método main
     * 
     */
    public static void main(String[] args)
    {
        //Paso 1: Declarar la variable vector de alturas
        
        double []altura= new double[15];
        
        //Paso 2: Declarar indice y promedio (iniciarlo)
        
        int i;
        double prom = 0;
        
        //Paso 3: Declarar y crear el scanner
        
        Scanner in = new Scanner(System.in);
        
        //Paso 4: Crear el vector para 15 valores
        
        for (i=0; i<=14; i++) {
            altura[i] = 0;
        }
        
        //Paso 5: Ingresar 15 numeros, cargarlos en el vector, ir calculando la suma
        double tot= 0;
        for (i=0; i<=14; i++) {
            double altu = in.nextDouble();
            altura[i] = altu;
            tot= tot + altu;
        }
        for (i=0; i<=14; i++) {
             System.out.print(" | " + altura[i]);
            }
        //Paso 6: Calcular el promedio
        
        prom = tot/15;
        System.out.println("El promedio es:" + prom);
        
         //Paso 7: Recorrer el vector, contar los números que son mayores que el promedio
         int num= 0;
         for (i=0; i<=14; i++) {
             if (altura[i] > prom) {
                 num++;
             }
         }
         System.out.println("ommomoi: " + num);
         
         in.close();
    }
}
