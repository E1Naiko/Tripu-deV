public abstract class absCuenta{
    private int numCuenta;
    private int cbu;
    private String alias;
    private double dinero;
    private int propCUIT;
    private String propNombre;
    private String propApellido;

    public absCuenta (int numCuenta, int cbu, String alias, double dinero, int propCUIT, String propNombre, String propApellido){
        this.setNumCuenta(numCuenta);
        this.setCbu(cbu);
        this.setAlias(alias);
        this.setDinero(dinero);
        this.setPropCUIT(propCUIT);
        this.setPropNombre(propNombre);
        this.setPropApellido(propApellido);
    }

    // Constructores
    public absCuenta (){}

    // Getters
    public int getNumCuenta(){
        return numCuenta;
    }

    public int getCbu(){
        return cbu;
    }

    public String getAlias(){
        return alias;
    }

    public double getDinero(){
        return dinero;
    }

    public int getPropCUIT(){
        return propCUIT;
    }

    public String getPropNombre(){
        return propNombre;
    }

    public String getPropApellido(){
        return propApellido;
    }

    // Setters
    public void setNumCuenta(int numCuenta){
        this.numCuenta = numCuenta;
    }

    public void setCbu(int cbu){
        this.cbu = cbu;
    }

    public void setAlias(String alias){
        this.alias = alias;
    }

    public void setDinero(double dinero){
        this.dinero = dinero;
    }

    public void setPropCUIT(int propCUIT){
        this.propCUIT = propCUIT;
    }

    public void setPropNombre(String propNombre){
        this.propNombre = propNombre;
    }

    public void setPropApellido(String propApellido){
        this.propApellido = propApellido;
    }

    // Declaracion de metodos abstractos
    public abstract double calcMontoMensual();

    // toString, como el ejercicio c y d piden usar metodos para imprimir, decidi usar los get, pero no es necesario
    public String toString(){
        return "Datos de la cuenta :" +
        " Numero de Cuenta: " + this.getNumCuenta() + 
        ", CBU: " + this.getCbu() + 
        ", Alias: " + this.getAlias() + 
        ", Dinero en Cuenta: $" + this.getDinero() + 
        ", CUIT del Propietario: " + this.getPropCUIT() + 
        ", Propietario: " + this.getPropNombre() + 
        ", " + this.getPropApellido();
    }
}