public class objBalanzaBasico
{
    private int cantidadItems;
    private double montoTotal;
    
    
    // Constructor
    public void objBalanzaBasico(double montoTotal, int cantItems){
        this.montoTotal = montoTotal;
        this.cantidadItems = cantItems;
    }
    public void objBalanzaBasico(){
        
    }
    
    // Metodos Internos
    public void iniciarCompra(){
        montoTotal = (double) 0.0;
        cantidadItems = (int) 0;
    }
    
    public void registrarProducto(double pesoEnKg, double precioPorKg){
        montoTotal += (double) pesoEnKg * precioPorKg;
        cantidadItems++;
    }
    
    public double devolverMontoAPagar(){
        return montoTotal;
    }
    
    public boolean iniciadaConExito(){
        return ((montoTotal == 0.0) && (cantidadItems == 0));
    }
    
    public String devolverResumenDeCompra(){
        return "Total a pagar $" + montoTotal + " por la compra de " + cantidadItems + " productos";
    }
    
}
