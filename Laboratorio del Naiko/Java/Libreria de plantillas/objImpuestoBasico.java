public class objImpuestoBasico
{
    private String sujetoActivo; // Es la entidad que tiene el derecho de exigir el pago del impuesto. Generalmente, es el Estado o el gobierno.
    private String sujetoPasivo; // Es la persona o entidad que tiene la obligación de pagar el impuesto. Puede ser una persona física o jurídica.
    private double iva; // Impuesto al valor agregado.
    private int baseImponible; // Es la cantidad sobre la que se aplica la tasa del impuesto.
    private double tasaImpuesto; // Es el porcentaje que se aplica a la base imponible para calcular el monto del impuesto.
    private double montoImpuesto;

    // Constructor
    public objImpuestoBasico(String sujetoActivo, String sujetoPasivo, double iva, int baseImponible,
    double tasaImpuesto, double montoImpuesto){
        this.setSujetoActivo(sujetoActivo);
        this.setSujetoPasivo(sujetoPasivo);
        this.setIva(iva);
        this.setBaseImponible(baseImponible);
        this.setTasaImpuesto(tasaImpuesto);
        this.setMontoImpuesto(montoImpuesto);
    }

    public String getSujetoActivo(){
        return sujetoActivo;
    }

    public String getSujetoPasivo(){
        return sujetoActivo;
    }

    public double getIva(){
        return iva;
    }

    public int getBaseImponible(){
        return baseImponible;
    }

    public double getTasaImpuesto(){
        return tasaImpuesto;
    }

    public double getMontoImpuesto(){
        return montoImpuesto;
    }

    public void setSujetoActivo(String sujetoActivo){
        this.sujetoActivo = sujetoActivo;
    }

    public void setSujetoPasivo(String sujetoPasivo){
        this.sujetoPasivo = sujetoPasivo;
    }

    public void setIva(double iva){
        this.iva = iva;
    }

    public void setBaseImponible(int baseImponible){
        this.baseImponible = baseImponible;
    }

    public void setTasaImpuesto(double tasaImpuesto){
        this.tasaImpuesto = tasaImpuesto;
    }

    public void setMontoImpuesto(double montoImpuesto){
        this.montoImpuesto = montoImpuesto;
    }

    public String toString(){
        return "Sujeto Activo: " + sujetoActivo +
        ", SujetoPasivo: " + sujetoPasivo +
        ", IVA: " + iva +
        ", Base Imponible: " + baseImponible +
        ", Tasa del Impuesto: " + tasaImpuesto +
        ", Monto del Impuesto" + montoImpuesto;
    }

}
