
/**
 No Registradas, aquellas personas que no registraron la tarjeta SUBE en el sitio MiArgentina, de estas se
conoce si es estudiante universitario o no.
 */
public class NoRegis extends Persona
{
    private boolean estudiante;
    public NoRegis()
    {
    }
    
    public NoRegis(String nombre, int CUIT, int SUBE, boolean estudiante){
        super(nombre,CUIT,SUBE);
        this.estudiante = estudiante;
    }
    
    
    
    /*
       En el caso de las personas No Registradas, el costo final del viaje depende de lo siguiente: si viaja en
    Subte o en Colectivo al monto base del viaje se le aumenta un 60%, mientras que si viaja en Tren el
    monto base del viaje duplica su valor. Sin embargo, si la persona es estudiante universitaria, percibe
    menos aumentos: el monto del viaje en Colectivo es el precio base (sin ninguna modificación) mientras
    que para Subte es del 30% más al precio base y para trenes es sólo un 10% más.
    
    Para ambos casos, además, si algún viaje fue realizado durante los siguientes feriados nacionales:
    12/02/2024, 13/02/2024, 24/03/2024, 29/03/2024, el mismo tiene un costo adicional del 5% del
    monto del viaje (con aumentos y/o descuentos aplicados) en cualquier medio de transporte.
       */
    public String calcular(){
        double min = 9999;
        int idMin = 0;
        double max = -1; //Valor de prueba
        int idMax = 0;
        for (int i = 0; i<8; i++){
            double aux = super.getMonto(i);
            if (super.getMedio(i).equals("Subte") || super.getMedio(i).equals("Colectivo")){
                aux = aux + (aux*(60/100));
            }
            if (super.getMedio(i).equals("Tren")){
                aux += aux;
            }
            if (super.getMedio(i).equals("Colectivo") && (this.estudiante)){
                aux = super.getMonto(i);
            }
            if (super.getMedio(i).equals("Subte") && (this.estudiante)){
                aux = aux + (aux*(30/100));
            }
            if (super.getMedio(i).equals("Tren") && (this.estudiante)){
                aux = aux + (aux*(10/100));
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
        return("Datos de la persona: " + super.toString() + "<--- informacion de los viajes--->");
    }
}
