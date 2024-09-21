
/**
 * No Registradas, aquellas personas que no registraron la tarjeta SUBE en el sitio MiArgentina, de estas se
conoce si es estudiante universitario o no..
 * En el caso de las personas No Registradas, el costo final del viaje depende de lo siguiente: si viaja en
Subte o en Colectivo al monto base del viaje se le aumenta un 60%, mientras que si viaja en Tren el
monto base del viaje duplica su valor. Sin embargo, si la persona es estudiante universitaria, percibe
menos aumentos: el monto del viaje en Colectivo es el precio base (sin ninguna modificación) mientras
que para Subte es del 30% más al precio base y para trenes es sólo un 10% más.
 * @author (MezaAlam) 
 * @version (6/5/2024)
 */
public class NoRegistrada extends Persona
{
private boolean esEstudiante;

public NoRegistrada (boolean esEstudiante,String nombre, String apellido, int cuit, int numTarjeta, int cantViajes){
    super(nombre,apellido,cuit,numTarjeta,cantViajes);
    this.esEstudiante= esEstudiante;
}

public NoRegistrada (){}

public boolean getEsEstudiante(){
return esEstudiante;
}

public void setEsEstudiante(boolean esEstudiante){
this.esEstudiante = esEstudiante;
}

@Override
public double CostoFinal() {
    double monto=super.getImporte();
    if (super.getMedioTransporte().toUpperCase().equals("SUBTE") || (super.getMedioTransporte().toUpperCase().equals("COLECTIVO"))) {
        return monto += ((double)super.getImporte()*60/100);
    } else {
        if (super.getMedioTransporte().toUpperCase().equals("TREN")) {
            return monto= (super.getImporte() * 2);
        }
    }
    if (this.esEstudiante == true) {
        if (super.getMedioTransporte().toUpperCase().equals("COLECTIVO")){
            return monto= (super.getImporte());
        } else {
            if (super.getMedioTransporte().toUpperCase().equals("SUBTE")){
                return monto +=  ((double)super.getImporte()*30/100);
            } else {
                if (super.getMedioTransporte().toUpperCase().equals("TREN")){
                return monto +=  ((double)super.getImporte()*10/100);
            } 
            }
        }
    }
    return monto;
    }
    
public String toString(){
    String aux;
    aux =(super.toString());
    for (int i=0; i< super.getCantViajes(); i++){
            aux += ("el viaje: " +i+ "tuvo un costo de: "+this.CostoFinal()+ "pesos");
    }
    return aux;
    }
}