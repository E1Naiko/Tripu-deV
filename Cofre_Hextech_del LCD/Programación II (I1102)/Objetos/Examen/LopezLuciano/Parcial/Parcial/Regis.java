/**
 Registrado: aquellas personas que registraron la tarjeta SUBE en el sitio MiArgentina, de estas se conoce la
zona de residencia (de la A a la E) y el grupo social (1..5) al que pertenecen (Jubilados y Pensionados,
Estudiantes PROGRESAR, Veteranos de Malvinas, Beneficiarios AUH, Personal de Trabajo Doméstico)
 */
public class Regis extends Persona
{
    private String zona;
    private int grupo;
    public Regis()
    {
    }

    public Regis(String nombre, int CUIT, int SUBE,String zona, int grupo){
        super(nombre,CUIT,SUBE);
        this.zona = zona;
        this.grupo = grupo;
    }
    
    
    /*Para el caso de las personas Registradas, el costo final del viaje depende de lo siguiente: si la persona
    es beneficiaria de la Tarifa Social Federal**, no importa cuál sea el medio de transporte, el costo del
    viaje es un 55% más barato a partir del precio base de referencia. En caso de que no sea beneficiaria, al
    monto base se le aplica un 25% de aumento en Subte, un 15% de aumento para Colectivo y un 7.5%
    para Tren.  
    Para ambos casos, además, si algún viaje fue realizado durante los siguientes feriados nacionales:
    12/02/2024, 13/02/2024, 24/03/2024, 29/03/2024, el mismo tiene un costo adicional del 5% del
    monto del viaje (con aumentos y/o descuentos aplicados) en cualquier medio de transporte.
       */
    public String calcular(){
        double min = 9999;
        int idMin = 0;
        double max = -1; //valor de prueba
        int idMax = 0;
        for (int i = 0; i<8; i++){
            double aux = super.getMonto(i);
            TarifaSocialFederalSUBE TSF = new TarifaSocialFederalSUBE();
            if(TSF.esBeneficiario(this.zona,this.grupo)){
                aux = aux -(aux*(55/100));
            }else{
                if (super.getMedio(i).equals("Subte")){
                    aux = aux + (aux*(25/100));
                }
                if (super.getMedio(i).equals("Colectivo")){
                    aux = aux + (aux*(15/100));
                }
                if (super.getMedio(i).equals("Tren")){
                    aux = aux + (aux*(7.5/100));
                }
            }
            if((super.getFecha(i).equals("12/02/2024") || super.getFecha(i).equals("13/02/2024") || 
            (super.getFecha(i).equals("24/03/2024") || super.getFecha(i).equals("29/03/2024")))){
                aux = aux + (aux*(5/100));
            }
            if (aux < min){
                min = aux;
                idMin = super.getID(i);
            }
            if (aux > max){
                max = aux;
                idMax = super.getID(i);
            }
        }
        return ("El viaje mas caro fue de: " + max + "$" + "con identificacion: " + idMax
            + " y el viaje más barato fue de : "+ min + "$" + "con identificacion: " + idMin);
    }
    
    
    public String toString(){
        return("Datos de la persona: " + super.toString());
    }
}
