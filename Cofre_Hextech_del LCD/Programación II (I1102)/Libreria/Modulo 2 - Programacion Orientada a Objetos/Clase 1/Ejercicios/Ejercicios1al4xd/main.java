import java.util.Scanner;
public class main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        /* Ejercicio 1:
         *  Escriba un programa que lea desde teclado 3 valores double.
         * Determine si a partir de ellos se forma un triángulo válido
         * y en ese caso muestre en consola el perímetro del mismo. 

         * NOTA: Un triángulo es válido si se cumplen las siguientes tres
         * condiciones: 
         * (a < b + c) ,  (b < a + c), (c < a + b),
         * donde a,b,c son los lados.  
         */
        
        String chequeo;

        System.out.println("Ejercicio 1");
        chequeo = in.next().toUpperCase();
        if (chequeo.equals("SI")) {
            System.out.println("Introduzca los valores del triangulo");
            int ej1A, ej1B, ej1C;
            ej1A = in.nextInt();
            ej1B = in.nextInt();
            ej1C = in.nextInt();
            if ((ej1A < (ej1B + ej1C)) && (ej1B < (ej1A + ej1A)) && (ej1C < (ej1A + ej1B)))
                System.out.println("El trieangulo es VALIDO");
            else
                System.out.println("El trieangulo es INVALIDO");
        }

        /* Ejercicio 2:
         *  Escriba un programa para restringir la entrada de autos
         * al centro de la ciudad: sólo pasarán aquellos con patente
         * par. Para ello se leen números de patentes, por cada una
         * debe informar en consola si el auto tiene o no permitido
         * el paso.  La lectura finaliza cuando se ingresa la
         * patente 0. Al finalizar, informar el porcentaje de autos
         * que ingresaron respecto al total de autos. 
         */
        System.out.println("Ejercicio 2");
        chequeo = in.next().toUpperCase();
        if (chequeo.equals("SI")) {
            int ej2FIN = 0;
            int ej2Act;

            System.out.println("Introduzca una patente");
            ej2Act = in.nextInt();
            while (ej2Act != ej2FIN) {
                if ((ej2Act % 2) == 0)
                    System.out.println("La patente es VALIDA");
                else
                    System.out.println("La patente es INVALIDA");
                System.out.print("Introduzca otra patente o "+ ej2FIN +" para finalizar");
                ej2Act = in.nextInt();
            }
        }
        /* Ejercicio 3:
         *  Escriba un programa que imprima en consola el factorial
         * de un número N (ingresado por teclado, N > 0).
         *  Ejemplo: para N=5 debería imprimir 5! = 120
         */
        System.out.println("Ejercicio 3");
        chequeo = in.next().toUpperCase();
        if (chequeo.equals("SI")) {

            int i3;
            int ej3res = 1;
            System.out.println("Introduzca un N positivo:");
            int ej3N = in.nextInt();

            while (ej3N < 0) {
                System.out.println("ERROR - numero entero negativo");
                ej3N = in.nextInt();   
            }

            if (ej3N == 0) System.out.println("0!=" + ej3res);
            else {
                ej3res = 1;
                for (i3=1; i3<ej3N+1; i3++) ej3res = ej3res*i3;
                System.out.println(ej3N + "!=" + ej3res);
            }
        }
        /* Ejercicio 4:
         *   Escriba un programa que imprima en consola el factorial de
         * todos los números entre 1 y 9. ¿Qué modificación debe hacer
         * para imprimir el factorial de los números impares solamente?
         */

        System.out.println("Ejercicio 4");
        chequeo = in.next().toUpperCase();
        if (chequeo.equals("SI")) {
            int i4;
            int ej4res = 1;
            System.out.print("Introduzca un N positivo:");
            int ej4N = in.nextInt();

            while (ej4N < 0) {
                System.out.println("ERROR - numero entero negativo");
                ej4N = in.nextInt();   
            }

            if (ej4N == 0) System.out.println("0!=" + ej4res);
            else {
                ej4res = 1;
                for (i4=1; i4<ej4N+1; i4++) {
                    ej4res = ej4res*i4;
                    System.out.println(ej4N + "!=" + ej4res);    
                }
            }
        }
        in.close();
    }
}
