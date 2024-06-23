/**
a) Realice un programa que almacene en un vector 15 personas. La información de cada persona debe leerse de teclado. 
Luego de almacenar la información:    
b) Agregue un método que devuelva la cantidad de personas mayores de 65 años.
c) Agregue un método que devuelva la representación de la persona con menor DNI.
d) Muestre desde el programa principal la cantidad de personas mayores de 65 años y muestre también la representación por pantalla de una persona con menor DNI.
 */
import java.util.Scanner;
public class Clase2 {
    public static void main(String[] args) {
        Scanner in= new Scanner(System.in);
        Persona[]vector= new Persona[15];
        int i;
        int min= 99999999;
        int cant= 0;
        for (i=0; i<14; i++) {
            System.out.print("Nombre: ");
            String nom= in.next();
            System.out.print("Dni: ");
            int dni= in.nextInt();
            System.out.print("Edad: ");
            int edad= in.nextInt();
            vector[i] = new Persona(nom,dni,edad);
            System.out.println(vector[i].toString());
            if ( vector[i].getEdad() > 65 ) {
                cant++;
            }
            if ( vector[i].getDNI() > min ) {
                System.out.println("Persona con el menor DNI: ");
                System.out.println(vector[i].toString());
                min = vector[i].getDNI(); 
            }
        }
        System.out.println("Personas mayores a 65 años: " + cant);
        in.close();
    }
}