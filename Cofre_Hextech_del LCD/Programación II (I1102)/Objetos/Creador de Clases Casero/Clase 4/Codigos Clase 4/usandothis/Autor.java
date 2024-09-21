/*
Clase Autor usando la referencia this. 
 */
/**
 * @author vsanz
 */
public class Autor {
   private String nombre;
   private String origen; 
   private String biografiaCorta; 
    
    public Autor (String nombre, String origen, String biografiaCorta){
      this.nombre=nombre;
      this.origen=origen;
      this.biografiaCorta=biografiaCorta;
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
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    public void setOrigen(String origen){
        this.origen=origen;
    }
    public void setBiografiaCorta(String biografiaCorta){
        this.biografiaCorta=biografiaCorta;
    }
}
