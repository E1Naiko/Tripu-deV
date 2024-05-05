/*
 * 2-   Utilizando la clase Persona (ya implementada). 
 * a) Realice un programa que almacene en un vector 15 personas.
 *  La información de cada persona debe leerse de teclado. 

 * Luego de almacenar la información:    
 * b) Agregue un método que devuelva la cantidad de personas
 *  mayores de 65 años.
 * c) Agregue un método que devuelva la representación de la
 *  persona con menor DNI.
 * d) Muestre desde el programa principal la cantidad de personas
 *  mayores de 65 años y muestre también la representación por
 *  pantalla de una persona con menor DNI.

 */
import java.util.Scanner;
public class main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int DIMF = 3;
        int MAYORQUE = 65;
        int DEFDNI = 99999999;
        int menorDni = DEFDNI;
        int contMayores = 0;
        int i, dni, edad, auxDni;
        Persona pMenorDni = null;
        Persona v[] = new Persona[DIMF];

        String nombre;

        // CARGA DE DATOS
        for (i=0; i<DIMF; i++){
            System.out.println("Nombre:");
            nombre = in.next();
            System.out.println("DNI:");
            dni = in.nextInt();
            System.out.println("Edad:");
            edad = in.nextInt();
            System.out.println("------------------------------");
            v[i] = new Persona(nombre, dni, edad);
        }

        /* // DEBUG IMPRIMIR VECTOR DE OBJETOS
        for (i=0; i<DIMF; i++)
        System.out.println(v[i].toString());
         */

        for (i=0; i<DIMF; i++) {
            if (v[i].getDNI() > MAYORQUE) {
                contMayores++;
            }
            auxDni = v[i].getDNI(); // puedo hacer lo mismo sin declarar una nueva variable, pero en ese caso estaria usando el getDNI 2 veces
            if (auxDni < menorDni){
                menorDni = auxDni;
                pMenorDni = v[i];
            }
        }

        System.out.println(" Cantidad de personas mayores que 65: " + contMayores);
        if (pMenorDni == null) {
            System.out.println("ERROR - MENOR DNI NO ENCONTRADO");
        }
        else {
            System.out.println(pMenorDni.toString());
        }

        in.close();
    }
}