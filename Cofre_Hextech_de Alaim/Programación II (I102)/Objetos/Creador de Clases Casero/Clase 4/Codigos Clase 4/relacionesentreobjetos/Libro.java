
public class Libro {
    private String titulo;
    private int paginas;
    private String editorial;
    private int añoEdicion;
    private String idioma;
    private Autor primerAutor;  /* MODIFICACION. primerAutor es un objeto*/
    private String ISBN; 
    private double precio;
    private int cantidadEnStock;
    

      
    public Libro(  String unTitulo, int unaCantidadPaginas,  String unaEditorial, 
    int unAñoEdicion, String unIdioma,  Autor unPrimerAutor, String unISBN, double unPrecio,  int unaCantidadStock){
         titulo = unTitulo;
         paginas = unaCantidadPaginas;
         editorial = unaEditorial; 
         añoEdicion= unAñoEdicion;
         idioma= unIdioma; 
         primerAutor = unPrimerAutor;
         ISBN =  unISBN;
         precio = unPrecio;
         cantidadEnStock = unaCantidadStock; 
    }
    
    public Libro(  String unTitulo, int unaCantidadPaginas,  String unaEditorial, Autor unPrimerAutor, String unISBN, double unPrecio,  int unaCantidadStock){
         titulo = unTitulo;
         paginas = unaCantidadPaginas;
         editorial = unaEditorial; 
         añoEdicion= 2015;
         idioma= "Inglés"; 
         primerAutor = unPrimerAutor;
         ISBN =  unISBN;
         precio = unPrecio;
         cantidadEnStock = unaCantidadStock; 
    }
    
    public Libro(){
   
    }
    
    
    public String getTitulo(){
        return titulo;
    }
    public int getPaginas(){
        return paginas;
    }
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }
    public String getIdioma(){
        return idioma;
    }
    public Autor getPrimerAutor(){   /* MODIFICACION */
        return primerAutor;
    } 
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
    public int getCantidadEnStock(){
        return cantidadEnStock;
    }
    
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
    public void setPaginas(int unaCantidad){
        paginas = unaCantidad;
    }
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAñoEdicion(int unAño){
         añoEdicion = unAño;
    }
    public void setIdioma(String unIdioma){
         idioma=unIdioma;
    }
    public void setPrimerAutor(Autor unPrimerAutor){ /* MODIFICACION */
         primerAutor=unPrimerAutor;
    } 
    public void setISBN(String unISBN){
         ISBN=unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio=unPrecio;
    }
    public void setCantidadEnStock(int unaCantidad){
         cantidadEnStock=unaCantidad;
    }
    
    @Override
    public String toString(){  /* MODIFICACION */
       //Cuidado: un error comun es intentar acceder a la v.i nombre del objeto primerAutor - NO es posible ya que 
       //estamos en la clase Libro
       return (titulo + " por " + primerAutor.getNombre() + " - " + añoEdicion + " - " + " ISBN: " + ISBN );
       
    }
        
    
        
}
