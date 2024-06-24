/*
Se dispone de una clase Persona (descargar de moodle). Un objeto persona puede crearse sin valores iniciales, agregando luego su nombre, DNI y edad (en ese orden). Un objeto persona responde a los siguientes mensajes: 
getNombre()	retorna el nombre (String) de la persona
getDNI()	retorna el dni (int) de la persona
getEdad()	retorna la edad (int) de la persona
setNombre(X)	modifica el nombre de la persona al “String” pasado por parámetro (X)
setDNI(X)	modifica el DNI de la persona al “int” pasado por parámetro (X)
setEdad(X)	modifica la edad de la persona al “int” pasado por parámetro (X)
toString()	retorna un String que representa al objeto. Ej:  “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años” 

a) Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego muestre en consola la representación de ese objeto en formato String. 
*/
import java.util.Scanner;
    public class Clase2 {
        public static void main(String[] args) {
            Scanner in= new Scanner(System.in);
            String nom;
            int dni,edad;
            System.out.print("Nombre:");
            nom = in.next();
            System.out.print("DNI:");
            dni = in.nextInt();
            System.out.print("Edad:");
            edad = in.nextInt();
            Persona per = new Persona (nom,dni,edad);
            
            System.out.println(" Mi nombre es " + per.getNombre() + " con Dni " + per.getDNI() + " tengo " + per.getEdad() + " años " );
            
            System.out.println( per.toString());
            in.close();
        }
    }
            