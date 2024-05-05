public class objCuentaAhorro extends absCuenta{
    private int cantTarjetasCredito;
    private int dimF;
    private int dimL;
    private boolean tienePlazoFijo;
    private objTransaccion [] vecUltimasTransacciones;

    public objCuentaAhorro (int numCuenta, int cbu, String alias, double dinero,
    int propCUIT, String propNombre, String propApellido, int cantTarjetasCredito, 
    boolean tienePlazoFijo, int dimF){
        
        super(numCuenta, cbu, alias, dinero, propCUIT, propNombre, propApellido);
        this.setCantTarjetasCredito(cantTarjetasCredito);
        this.setTienePlazoFijo(tienePlazoFijo);
        vecUltimasTransacciones = new objTransaccion[dimF];
        this.dimF = dimF;
        dimL = 0;
    }

    // Constructores
    public objCuentaAhorro (){}

    // Getters
    public int getCantTarjetasCredito(){
        return cantTarjetasCredito;
    }
    
    public boolean getTienePlazoFijo(){
        return tienePlazoFijo;
    }

    public String getVecUltimasTransacciones(){
        String aux = "";
        for (int i=0; i<dimL; i++){
            aux += " Transaccion " + i + ": " + vecUltimasTransacciones[i].toString();
        }
        return aux;
    }

    // Setters
    public void setCantTarjetasCredito(int cantTarjetasCredito){
        this.cantTarjetasCredito = cantTarjetasCredito;
    }
    public void setTienePlazoFijo(boolean tienePlazoFijo){
        this.tienePlazoFijo = tienePlazoFijo;
    }

    // Declaracion de metodos abstractos
    public double calcMontoMensual(){
        double monto = 0;
        if (tienePlazoFijo){
            monto -= super.getDinero()*2/100;
        }
        switch (this.getCantTarjetasCredito()){
            case 0: {
                monto += 0;
            }
            break;
            case 1: {
                monto -= 1000;
            }
            break;
            case 2: {
                monto -= 1800;
            }
            break;
        }
        for (int i=0; i<dimL; i++){
            if (vecUltimasTransacciones[i].getConcepto().equals("DEB.CPRA.VTA")){
                monto -= (vecUltimasTransacciones[i].getMonto()* 35/100 + vecUltimasTransacciones[i].getMonto()* 3/10);
            }
        }
        return monto;
    }
    
    // Declaracion de metodos publicos
    public void insertarVector(String concepto, double monto){
        if (dimL<dimF){
            vecUltimasTransacciones[dimL] = new objTransaccion(concepto, monto);
            dimL++;
        }
        else {
            for (int i=(dimF-1); i>0; i++){
                vecUltimasTransacciones[i+1]= vecUltimasTransacciones[i];
            }
            vecUltimasTransacciones[0] = new objTransaccion(concepto, monto);
        }
    }

    // toString, como el ejercicio c y d piden usar metodos para imprimir, decidi usar los get, pero no es necesario
    public String toString(){
        return "Cuenta Ahorro: " +
        super.toString() + 
        ", Cantidad de Tarjetas de Credito: " + this.getCantTarjetasCredito()+
        ", Tiene Plazo Fijo: " + this.getTienePlazoFijo() +
        this.getVecUltimasTransacciones() +
        ", Monto Mensual: $" + this.calcMontoMensual();
    }
}