
public class Autor {
   private String nombre;
   private String origen; 
   private String biografiaCorta; 
    
    public Autor (String unNombre, String unOrigen, String unaBiografia){
      nombre=unNombre;
      origen=unOrigen;
      biografiaCorta=unaBiografia;
   
   }
    public String getNombre(){
        return nombre;
    }
    public String getOrigen(){
        return origen;
    }
    public String getBiografiaCorta(){
        return biografiaCorta;
    }
    public void setNombre(String unNombre){
        nombre=unNombre;
    }
    public void setOrigen(String unOrigen){
        origen=unOrigen;
    }
    public void setBiografiaCorta(String unaBiografia){
        biografiaCorta=unaBiografia;
    }
}
