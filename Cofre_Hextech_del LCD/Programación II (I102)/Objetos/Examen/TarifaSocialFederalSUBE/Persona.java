
/**
 * . De cada persona se conoce: nombre y apellido, CUIT, número
de tarjeta SUBE, y sus últimos viajes (a lo sumo 8)..
 * 
 * @author (Meza) 
 * @version (6/5/2024)
 */
public abstract class Persona{
private String nombre;
private String apellido;
private int cuit;
private int numTarjeta;
private int viajesRealizado;
private Viaje [] viajes;
private int cantViajes;

public Persona (String nombre, String apellido, int cuit, int numTarjeta, int cantViajes){
this.nombre= nombre;
this.apellido= apellido;
this.cuit= cuit;
this.numTarjeta= numTarjeta;
this.viajesRealizado= 0;
this.cantViajes= cantViajes;
this.viajes = new Viaje[cantViajes];
}

public Persona (){
}

public void Agregar ( Viaje viaje){
    if( viajesRealizado < cantViajes) {
        viajes[viajesRealizado]= viaje;
        viajesRealizado++;
    }
}
public String getMedioTransporte (){
    return viajes[viajesRealizado].getMedioTransporte();
}

public double getImporte (){
    return viajes[viajesRealizado].getMontoBase();
}

public int getCantViajes (){
    return cantViajes;
}
public String getNombre(){
    return nombre;
}
public String getApellido(){
    return apellido;
}
public int getCuit(){
    return cuit;
}
public int getNumTarjeta(){
    return numTarjeta;
}

public void setNombre(String nombre){
    this.nombre = nombre;
}
public void setApellido(String apellido){
    this.apellido = apellido;
}
public void setCuit(int cuit){
    this.cuit = cuit;
}
public void setNumTarjeta(int numTarjeta){
    this.numTarjeta = numTarjeta;
}

public abstract double CostoFinal();

public String toString () {
    String aux;
    aux= (" NombreApellido: " +nombre + apellido+ " Cuit: " +cuit+ " NumTarjeta: " +numTarjeta );
    for (int i = 0; i< cantViajes; i++){
        return aux += (viajes[i].toString());
    }
    return aux;
}
}