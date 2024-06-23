
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
    
    public Libro(){
   
    }
    /* Ejemplo USO 1: cuando los parametros tienen el mismo nombre que la variable de instancia.
    Se accede a la variable de instancia haciendo this.nombreVariableInstancia  */
    public Libro(  String titulo, int paginas,  String editorial, 
    int añoEdicion, String idioma,  Autor primerAutor, String ISBN, double precio,  int cantidadEnStock){
         this.titulo = titulo;
         this.paginas = paginas;
         this.editorial = editorial; 
         this.añoEdicion= añoEdicion;
         this.idioma= idioma; 
         this.primerAutor = primerAutor;
         this.ISBN =  ISBN;
         this.precio = precio;
         this.cantidadEnStock = cantidadEnStock; 
    }
    
    /* Ejemplo USO 2: invocar a otro constructor de esta clase haciendo this(parametros de dicho constructor)
    Restriccion: la invocacion al otro constructor debe ser la primera linea de codigo */
    public Libro(  String titulo, int paginas,  String editorial, Autor primerAutor, String ISBN, double precio,  int cantidadEnStock){
        
        this(titulo,paginas, editorial, 2015, "inglés",primerAutor, ISBN, precio, cantidadEnStock);
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
    
    public void setTitulo(String titulo){
        this.titulo = titulo;
    }
    public void setPaginas(int paginas){
        this.paginas = paginas;
    }
    public void setEditorial(String editorial){
         this.editorial = editorial;
    }
    public void setAñoEdicion(int añoEdicion){
         this.añoEdicion = añoEdicion;
    }
    public void setIdioma(String idioma){
         this.idioma=idioma;
    }
    public void setPrimerAutor(Autor primerAutor){
         this.primerAutor=primerAutor;
    }
    public void setISBN(String ISBN){
         this.ISBN=ISBN;
    } 
    public void setPrecio(double precio){
         this.precio=precio;
    }
    public void setCantidadEnStock(int cantidadEnStock){
         this.cantidadEnStock=cantidadEnStock;
    }
    
    /* Ejemplo USO 3: Enviarse mensajes a si mismo. */
    @Override
    public String toString(){  /* MODIFICACION */
      
       return (this.getTitulo() + " por " + this.getPrimerAutor().getNombre() + " - " + this.getAñoEdicion() + " - " + " ISBN: " + this.getISBN() );
       
    }    
}