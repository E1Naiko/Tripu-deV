/**
El Ministerio de Economía de la Nación desea realizar unas estadísticas a partir de la información de los viajes
realizados por las personas a través de sus tarjetas SUBE. De cada persona se conoce: nombre y apellido, CUIT, número
de tarjeta SUBE, y sus últimos viajes (a lo sumo 8). De cada viaje se registra: identificador, fecha del viaje
(DD/MM/AAAA), monto base y el medio de transporte (Tren, Colectivo o Subte).
 */
public abstract class Persona
{
    // instance variables - replace the example below with your own
    private String nombre;
    private int CUIT;
    private int SUBE;
    private Viaje [] V;

    
    public Persona()
    {}
    
    public Persona(String nombre, int CUIT, int SUBE){
        this.nombre = nombre;
        this.CUIT = CUIT;
        this.SUBE = SUBE;
        V = new Viaje[8];        
    }
    
    public void setViaje(int i, Viaje V){
        this.V[i] = V;
    }
    
    public double getMonto(int i){
        return this.V[i].getMonto();
    }
    
    public String getMedio(int i){  
        return this.V[i].getMedio();
    }
    
    public String getFecha(int i){  
        return this.V[i].getFecha();
    }
    
    public int getID(int i){  
        return this.V[i].getID();
    }
    
    public abstract String calcular();
    
    public String infoViajes(int i){
        return("Identificador: " + getID(i) + "Fecha : " + getFecha(i) + " Monto Base: " + getMonto(i)
            + " Medio de transporte : " + getMedio(i));
    }
    
    public String toString(){
        return ("Nombre: " + this.nombre + " Cuit: " + this.CUIT + " Numero de Sube : " + this.SUBE);
    }
}
