import java.util.Scanner;

public class p32026tp1ej1main{

    /*
        1. Escriba tres métodos de clase (static) que reciban por parámetro dos números enteros (tipo
    int) a y b e impriman todos los números enteros comprendidos entre a; b (inclusive), uno por
    cada línea en la salida estándar. Para ello, dentro de una nueva clase escriba un método por
    cada uno de los siguientes incisos:
    
    a. Que realice lo pedido con un for.
    b. Que realice lo pedido con un while.
    c. Que realice lo pedido sin utilizar estructuras de control iterativas (for, while, do
    while).
    
    Por último, escriba en el método de clase main el llamado a cada uno de los métodos
    creados, con valores de ejemplo. En su computadora, ejecute el programa y verifique
    que se cumple con lo pedido.

     */

    static private void metodoA(int a, int b){
        for (int i=a+1; i<b; i++){
            System.out.println(" M A: " + i);
        }
    }
    
    private static void metodoB(int a, int b){
        int i = a+1;
        while (i<b){
            System.out.println(" M B: " + i);
            i++;
        }
    }

    private static String metodoC(int a, int b){
        a++;
        if (a<b){
            return a + " " + metodoC(a, b);
        }
        else return "";
    }

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int a, b;
        
        a = in.nextInt();
        b = in.nextInt();

        if (a<b){
            metodoA(a, b);
            metodoB(a, b);
            System.out.println(" M C: " + metodoC(a, b));
        }

        in.close();
    }

}