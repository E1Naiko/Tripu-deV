public abstract class absProducto extends objCompra{
    private int codigo;
    private String nombre;
    private String marca;
    private double precioXUnidad;
    private int cantUnidadesAdquiridas;

    public absProducto (int codigo, String nombre, String marca, double precioXUnidad, int cantUnidadesAdquiridas){
        this.setCodigo(codigo);
        this.setNombre(nombre);
        this.setMarca(marca);
        this.setPrecioXUnidad(precioXUnidad);
        this.setCantUnidadesAdquiridas(cantUnidadesAdquiridas);
    }

    // Constructores
    public absProducto (){}

    // Getters
    public int getCodigo(){
        return codigo;
    }

    public String getNombre(){
        return nombre;
    }

    public String getMarca(){
        return marca;
    }

    public double getPrecioXUnidad(){
        return precioXUnidad;
    }

    public int getCantUnidadesAdquiridas(){
        return cantUnidadesAdquiridas;
    }

    // Setters
    public void setCodigo(int codigo){
        this.codigo = codigo;
    }

    public void setNombre(String nombre){
        this.nombre = nombre;
    }

    public void setMarca(String marca){
        this.marca = marca;
    }

    public void setPrecioXUnidad(double precioXUnidad){
        this.precioXUnidad = precioXUnidad;
    }

    public void setCantUnidadesAdquiridas(int cantUnidadesAdquiridas){
        this.cantUnidadesAdquiridas = cantUnidadesAdquiridas;
    }

    // Declaracion de metodos abstractos
    public abstract double calcularMonto();
    
    // toString
    public String toString(){
        return " - Codigo: " + codigo + 
        ", nombre: " + nombre + 
        ", marca: " + marca + 
        ", precioXUnidad: " + precioXUnidad + 
        ", cantUnidadesAdquiridas: " + cantUnidadesAdquiridas;
}
}