
/**
 * De cada viaje se registra: identificador, fecha del viaje
(DD/MM/AAAA), monto base y el medio de transporte (Tren, Colectivo o Subte)..
 * 
 * @author (MezaAlam) 
 * @version (6/5/2024)
 */
public class Viaje{
private int identificador;
private String fecha;
private double montoBase;
private String medioTransporte;

public Viaje (int identificador, String fecha, double montoBase, String medioTransporte){
this.identificador= identificador;
this.fecha= fecha;
this.montoBase= montoBase;
this.medioTransporte= medioTransporte;
}

public Viaje (){}

public int getIdentificador(){
    return identificador;
}
public String getFecha(){
    return fecha;
}
public double getMontoBase(){
    return montoBase;
}
public String getMedioTransporte(){
    return medioTransporte;
}

public void setIdentificador(int identificador){
    this.identificador = identificador;
}
public void setFecha(String fecha){
    this.fecha = fecha;
}
public void setMontoBase(double montoBase){
    this.montoBase = montoBase;
}
public void setMedioTransporte(String medioTransporte){
    this.medioTransporte = medioTransporte;
}

public String toString(){
    return("Identificador: " +identificador+ "Fecha: "+fecha+ "Monto: " +montoBase+ "Medio de transporte: "+ medioTransporte);
}
}