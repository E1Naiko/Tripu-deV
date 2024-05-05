public class objProductoFueraCA extends absProducto{
    private String origen;

    public objProductoFueraCA (int codigo, String nombre, String marca, double precioXUnidad, int cantUnidadesAdquiridas, String origen){
        super(codigo, nombre, marca, precioXUnidad, cantUnidadesAdquiridas);
        this.setOrigen(origen);
    }

    // Constructores
    public objProductoFueraCA (){}

    // Getters
    public String getOrigen(){
        return origen;
    }

    // Setters
    public void setOrigen(String origen){
        this.origen = origen;
    }

    // Declaracion de metodos abstractos
    public double calcularMonto(){
        double monto = super.getPrecioXUnidad() * super.getCantUnidadesAdquiridas();
        if (origen.equals("IMPORTADO")){
            monto += monto*15/100;
        }
        else {
            monto += monto*3/100;
        }
        if (super.getMetodoPago().toUpperCase().equals("DEBITO") && super.getEsJubiladoPensionado()){
            monto -= monto*1/10;
        }
        return monto;
    }

    // toString
    public String toString(){
        return super.toString() +
        ", Origen: " + 
        ", Monto Total de la compra: " + calcularMonto();
    }
}