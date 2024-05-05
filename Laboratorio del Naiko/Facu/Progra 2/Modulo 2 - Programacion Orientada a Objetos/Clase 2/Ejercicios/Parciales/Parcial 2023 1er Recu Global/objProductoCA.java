public class objProductoCA extends absProducto{
    private boolean formanParte;

    public objProductoCA (int codigo, String nombre, String marca, double precioXUnidad,
    int cantUnidadesAdquiridas, boolean formanParte){
        super(codigo, nombre, marca, precioXUnidad, cantUnidadesAdquiridas);
        this.setFormanParte(formanParte);
    }

    // Constructores
    public objProductoCA (){}

    // Getters
    public boolean getFormanParte(){
        return formanParte;
    }

    // Setters
    public void setFormanParte(boolean formanParte){
        this.formanParte = formanParte;
    }

    // Declaracion de metodos publicos
    public boolean fechaSupera(){
        int anio, mes, dia;
        anio = super.getFechaAnio();
        mes = super.getFechaMes();
        dia = super.getFechaDia();

        boolean aux = false;
        if (anio > 2023){
            aux = true;
        }
        else if ((anio == 2023) && (mes > 9)) {
            aux = true;
        }
        else if ((anio == 2023) && (mes == 9) && (dia >= 25)){
            aux = true;
        }
        return aux;
    }

    // Declaracion de metodos abstractos
    public double calcularMonto(){
        double monto = super.getPrecioXUnidad() * super.getCantUnidadesAdquiridas();

        // uso un auxiliar para ver si la compra actual cumple con el programa compre sin iva
        ProgramaCompreSinIVA cumpleCondicion = new ProgramaCompreSinIVA();
        if (formanParte){
            monto -= monto*5/100;
        }
        if (super.getMetodoPago().toUpperCase().equals("DEBITO")){
            if (this.fechaSupera() && (cumpleCondicion.productoIncluido(super.getNombre()))){
                monto += monto*21/100;
            }
            if (super.getEsJubiladoPensionado()){
                monto -= monto*1/10;
            }
        }
        else {
            monto += monto*35/100;
        }
        return monto;
    }

    // toString
    public String toString(){
        return super.toString() + 
        ", Forman Parte: " + formanParte + 
        ", Monto Total de la compra: " + calcularMonto();
    }
}