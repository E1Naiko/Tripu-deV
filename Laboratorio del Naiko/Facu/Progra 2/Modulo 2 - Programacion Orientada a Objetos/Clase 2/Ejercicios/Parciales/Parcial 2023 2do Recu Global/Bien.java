public class Bien
{
    private String origen;
    private int cantidad;
    private double costo;
    
    // Constructor
    public Bien(String origen, int cantidad, double costo){
        this.setOrigen(origen);
        this.setCantidad(cantidad);
        this.setCosto(costo);
    }
    
    public String getOrigen(){
        return origen;
    }
    
    public int getCantidad(){
        return cantidad;
    }
    
    public double getCosto(){
        return costo;
    }
    
    public void setOrigen(String origen){
        this.origen = origen;
    }
    
    public void setCantidad(int cantidad){
        this.cantidad = cantidad;
    }
    
    public void setCosto(double costo){
        this.costo = costo;
    }
    
    
    public String toString(){
        return "Origen: " + origen +
        ", Cantidad: " + cantidad +
        ", Costo: " + costo + " ,";
    }
    
}
