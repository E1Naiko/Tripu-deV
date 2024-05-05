import java.util.ArrayList; 

/**
 * Write a description of class ProgramaCompreSinIVA here.
 * 
 * @author (Leandro Romanut) 
 * @version (1.0)
 */
public class ProgramaCompreSinIVA
{    
    public ProgramaCompreSinIVA()
    {

    }

    /**
     * Método para saber si un producto de la canasta básica forma parte del programa "Compre sin IVA"
     * 
     * @params nombre del producto
     * @return verdadero o falso
     */
    public static boolean productoIncluido(String nombre)
    {
        
        ArrayList<String> list = new ArrayList<String>();
        
        list.add("Pan");
        list.add("Leche");
        list.add("Galletitas");
        list.add("Sal");
        list.add("Hortalizas");
        list.add("Aceite");
        list.add("Vinagre");
        list.add("Yerba");
        list.add("Arroz");
        list.add("Carnes");
        list.add("Huevos");
        list.add("Café");
        list.add("Azúcar");
        
        return list.contains(nombre);
    }
}
