
/**
De cada viaje se registra: identificador, fecha del viaje
(DD/MM/AAAA), monto base y el medio de transporte (Tren, Colectivo o Subte)
 */
public class Viaje
{
    private int ID;
    private String fecha;
    private double monto;
    private String medio;
    public Viaje()
    {}
    
    public Viaje(int ID, String fecha, double monto, String medio){
        this.ID = ID;
        this.fecha = fecha;
        this.monto = monto;
        this.medio = medio;
    }
    
    public String getMedio(){
        return this.medio;
    }
    
    public double getMonto(){
        return this.monto;
    }
    
    public String getFecha(){
        return this.fecha;
    }
    
    public int getID(){
        return this.ID;
    }
}
