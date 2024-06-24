
/**
 * Registradas, aquellas personas que registraron la tarjeta SUBE en el sitio MiArgentina, de estas se conoce la
zona de residencia (de la A a la E) y el grupo social (1..5) al que pertenecen (Jubilados y Pensionados,
Estudiantes PROGRESAR, Veteranos de Malvinas, Beneficiarios AUH, Personal de Trabajo Doméstico).
 * Para el caso de las personas Registradas, el costo final del viaje depende de lo siguiente: si la persona
es beneficiaria de la Tarifa Social Federal**, no importa cuál sea el medio de transporte, el costo del
viaje es un 55% más barato a partir del precio base de referencia. En caso de que no sea beneficiaria, al
monto base se le aplica un 25% de aumento en Subte, un 15% de aumento para Colectivo y un 7.5%
para Tren.
 * @author (MezaAlam) 
 * @version (6/5/2024)
 */
public class Registradas extends Persona{
private String zonaResidencia;
private int grupoSocial;
private boolean esBeneficiario;
private TarifaSocialFederalSUBE tarifa;

public Registradas (String zonaResidencia, int grupoSocial, String nombre, String apellido, int cuit, int numTarjeta, int cantViajes){
    super(nombre, apellido, cuit, numTarjeta, cantViajes);
    this.zonaResidencia= zonaResidencia;
    this.grupoSocial=grupoSocial;
    this.esBeneficiario= false;
}

public Registradas (){}

public boolean getEsBeneficiario( String zona, int grupo){
    return tarifa.esBeneficiario(zona,grupo);
}

public String getZonaResidencia(){
return zonaResidencia;
}
public int getGrupoSocial(){
return grupoSocial;
}

public void setZonaResidencia(String zonaResidencia){
this.zonaResidencia = zonaResidencia;
}
public void setGrupoSocial(int grupoSocial){
this.grupoSocial = grupoSocial;
}
@Override
public double CostoFinal (){
    double monto = super.getImporte();
        if (this.esBeneficiario == true) {
            return monto -= ((double) super.getImporte()*55/100);
        } else {
            if (super.getMedioTransporte().toUpperCase().equals("SUBTE")){
                return monto += ((double)super.getImporte()*25/100);
            } else {
                if (super.getMedioTransporte().toUpperCase().equals("COLECTIVO")){
                    return monto +=  ((double)super.getImporte()*15/100);
                }else {
                    if (super.getMedioTransporte().toUpperCase().equals("TREN")){
                    return monto +=  ((double)super.getImporte()*7.5/100);
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
