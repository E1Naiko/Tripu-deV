public class objTransaccion{
    private String concepto;
    private double monto;

    public objTransaccion (String concepto, double monto){
        this.setConcepto(concepto);
        this.setMonto(monto);
    }

    // Constructores
    public objTransaccion (){}

    // Getters
    public String getConcepto(){
        return concepto;
    }

    public double getMonto(){
        return monto;
    }

    // Setters
    public void setConcepto(String concepto){
        this.concepto = concepto;
    }

    public void setMonto(double monto){
        this.monto = monto;
    }

    // Declaracion de metodos abstractos

    public String toString(){
        return ", concepto: " + concepto + 
        ", monto: " + monto;
    }
}