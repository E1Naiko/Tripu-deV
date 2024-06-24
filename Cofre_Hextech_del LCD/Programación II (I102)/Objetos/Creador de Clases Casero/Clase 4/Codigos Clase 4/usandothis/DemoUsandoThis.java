/*
Demo de la clase Libro. Relaciones entre objetos.
 */
/**
 * @author vsanz
 */
public class DemoUsandoThis {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
 
        Autor autor = new Autor( "Herbert Schildt", "Chicago, Illinois, Estados Unidos", "Herbert Schildt is an American computing author, programmer and musician. He has written books about the C and Java programming languages. He was also a founding member of the progressive rock band Starcastle.");
        Libro libro1= new  Libro(  "Java: A Beginner's Guide", 699,  "Mcgraw-Hill", 
   2014, "Inglés",  autor, "978-0071809252", 21.72, 100);
        System.out.println(libro1); // Se le envia automaticamente el mensaje toString() a libro1, ejecutando dicho método
                                    // desde el cual se le envia el mensaje getNombre() al objeto que conoce como su primerAutor
    }
    
}
