/* Ejercicio 6:
 *  Escriba un programa que defina una matriz de enteros de tamaño
 *  10x10. Inicialice la matriz con los primeros 100 números pares
 *  (ej: la pos. 0,0 contendrá 0; la pos. 0,1 contendrá 2; la pos.
 *  0,2 contendrá 4; así siguiendo). 
 * Luego realice las siguientes operaciones: 
 * -    Mostrar el contenido de la matriz en consola. 
 * -    Calcular e informar la suma de todos los elementos
 *    almacenados entre las filas 2 y 9 y las columnas 0 y 3
 * -    Generar un vector de 10 posiciones donde cada posición
 *    i contiene la suma de los elementos de la columna i de la
 *    matriz.
 * -    Lea un valor entero e indique si se encuentra o no en
 *    la matriz.
 *      En caso de encontrarse indique su ubicación (fila y columna) en
 *    caso contrario imprima “No se encontró el elemento”.

 */

import java.util.Scanner;
public class main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int FILAS = (int) 10; // CONSTANTE
        int COLUMNAS = (int) 10; // CONSTANTE
        int i, j, auxCarga, sum, numSeEncuentra;
        boolean seEncuentra;

        int [][] matriz = new int [FILAS][COLUMNAS];
        int [] nue = new int [COLUMNAS];

        auxCarga = 0;
        for (j=0; j<COLUMNAS; j++){
            for (i=0; i<FILAS; i++){
                matriz[i][j] = auxCarga;
                auxCarga = auxCarga + 2;
            }
        }

        // -    Mostrar el contenido de la matriz en consola.
        System.out.println("Matriz Completa");
        for (j=0; j<COLUMNAS; j++){
            System.out.print("[|");
            for (i=0; i<FILAS; i++){
                System.out.print(matriz[i][j] + "|");
            }
            System.out.println("]");
        }

        /*
        -    Calcular e informar la suma de todos los elementos
         *  almacenados entre las filas 2 y 9 y las columnas 0 y 3
         */ 
        sum = 0;
        for (j=0; j<COLUMNAS; j++){
            for (i=2; i < 10; i=i+7){
                sum = sum + matriz[i][j];
            }
        }
        for (j=0; j < 4; j=j+3){
            for (i=0; i<FILAS; i++){
                sum = sum + matriz[i][j];
            }
        }
        System.out.println("Suma de todos los elementos entre las filas 2 y 9 y las columnas 0 y 3: " + sum);

        /*
         * -    Generar un vector de 10 posiciones donde cada posición
         *    i contiene la suma de los elementos de la columna i de la
         *    matriz.
         */

        for (i=0; i < FILAS; i++){
            nue[i]= 0;
            for (j=0; j<COLUMNAS; j++){
                nue[i] = nue[i] + matriz[i][j];
            }
        }
        for (i=0; i<FILAS; i++)
            System.out.println(" Nuevo[" + i + "]=" + nue[i]);

        /*
         * -    Lea un valor entero e indique si se encuentra o no en
         *    la matriz.
         *      En caso de encontrarse indique su ubicación (fila y columna) en
         *    caso contrario imprima “No se encontró el elemento”.   
         */
        seEncuentra = false;
        System.out.println("Valor entero a buscar:");
        numSeEncuentra = in.nextInt();
        i = 0; j = 0;
        while ((j < 10)  &&  !(seEncuentra)) {
            while ((i < 10) && (matriz[j][i] != numSeEncuentra)) {
                i++;
            }
            if (i < 10) {
                seEncuentra = true;
            } else {
                j++;
                i = 0;
            }
        }
        if (seEncuentra)
            System.out.println("El numero " + numSeEncuentra + " se encontró en la posicion [" + i + "," + j + "]");
        else
            System.out.println("El numero " + numSeEncuentra + " no se encontró");
        
        in.close();
    }
}
