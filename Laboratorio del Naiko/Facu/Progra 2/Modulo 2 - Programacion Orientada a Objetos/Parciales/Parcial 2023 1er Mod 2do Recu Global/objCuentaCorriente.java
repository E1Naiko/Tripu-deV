public class objCuentaCorriente extends absCuenta{
    private double limiteDescubierto;
    private int cantCheques;

    public objCuentaCorriente (int numCuenta, int cbu, String alias, double dinero,
    int propCUIT, String propNombre, String propApellido, double limiteDescubierto,
    int cantCheques){

        super(numCuenta, cbu, alias, dinero, propCUIT, propNombre, propApellido);
        this.setLimiteDescubierto(limiteDescubierto);
        this.setCantCheques(cantCheques);
    }

    // Constructores
    public objCuentaCorriente (){}

    // Getters
    public double getLimiteDescubierto(){
        return limiteDescubierto;
    }

    public int getCantCheques(){
        return cantCheques;
    }

    // Setters
    public void setLimiteDescubierto(double limiteDescubierto){
        if (limiteDescubierto>0){
            this.limiteDescubierto = -limiteDescubierto;
        }
        else {
            this.limiteDescubierto = limiteDescubierto;
        }
    }

    public void setCantCheques(int cantCheques){
        this.cantCheques = cantCheques;
    }

    // Declaracion de metodos abstractos
    public double calcMontoMensual(){
        double monto = 0;
        double auxDinero = super.getDinero();
        monto -= auxDinero*5/100;
        if (cantCheques > 10){
            monto -= auxDinero*cantCheques*5/100;
        } else {
            monto -= auxDinero*cantCheques*2/100;
        }
        if ((auxDinero < 10000) && (monto<limiteDescubierto)){
            limiteDescubierto +=  monto; // el monto es negativo asi que sumo
        }

        return monto;
    }

    // toString, como el ejercicio c y d piden usar metodos para imprimir, decidi usar los get, pero no es necesario
    public String toString(){
        return "Cuenta Corriente: " +
        super.toString() +
        ", Monto Mensual: $" + this.calcMontoMensual() +
        ", Limite Descubierto: " + this.getLimiteDescubierto() + 
        ", Cantidad de Cheques: " + this.getCantCheques();
    }
}