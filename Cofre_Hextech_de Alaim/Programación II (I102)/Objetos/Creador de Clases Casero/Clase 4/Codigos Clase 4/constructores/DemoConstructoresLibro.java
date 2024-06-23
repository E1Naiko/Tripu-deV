/*
Demo que crea objetos Libro invocando a los constructores definidos.
 */
public class DemoConstructoresLibro {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Libro libro1= new  Libro( "Java: A Beginner's Guide", 699,  
                                 "Mcgraw-Hill", 2014, "Inglés",  
                                 "Herbert Schildt", "978-0071809252", 21.72, 100);
        Libro libro2= new Libro("Learning Java by Building Android Games", 392 , "CreateSpace Independent Publishing", "John Horton", "978-1512108347", 31.77, 100);
        System.out.println(libro1);
        System.out.println(libro2);
        System.out.println("Idioma de libro2: " +libro2.getIdioma());
        Libro libro3= new Libro();
    } 
}