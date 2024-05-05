/* De Bienes, de este tipo de subsidio se registran todos los bienes solicitados
 * (como máximo 10). De cada bien se conoce: origen, cantidad y costo por unidad.
 */
public class DeBienes extends Subsidio
{
    private int MAXBIENES;
    private int dimL;
    private Bien [] vecBienes;

    // Constructor
    public DeBienes (String nombrePlanTrabajo, int diaSolicitud, String mesSolicitud,
    int añoSolicitud, int cuit, String nombre, String apellido){
        super(nombrePlanTrabajo, diaSolicitud, mesSolicitud, añoSolicitud, cuit, nombre, apellido);
        vecBienes = new Bien [MAXBIENES];
        dimL = 0;
    }
    
    public DeBienes (int MAXBIENES){
        vecBienes = new Bien [MAXBIENES];
        dimL = 0;
    }

    public String getBienes(){
        String aux = "";
        for (int i = 0; i<MAXBIENES; i++){
            aux = aux + vecBienes[i].toString() + ", ";
        }
        return aux;
    }

    public int getDimL(){
        return dimL;
    }

    public boolean sePuedeInsertar(){
        return dimL < MAXBIENES;
    }
    
    public void insertarBien(String origen, int cantidad, double costo){
        boolean sePudo = false;
        vecBienes[dimL] = new Bien(origen, cantidad, costo);
        dimL++;
        sePudo = true;
    }

    public double valorTotalActual(){
        double ret = 0;
        for (int i = 0; i<dimL; i++){
            ret += vecBienes[i].getCosto();
        }
        return ret;
    }

    public boolean sePuedeOtorgarSubsidio(){
        boolean ret = false;
        int cantChina, cantArg;
        cantArg = 0;
        cantChina = 0;
        double aux = 0;

        if (valorTotalActual() < 500000){
            for (int i = 0; i<dimL; i++){
                if (vecBienes[i].getOrigen().toUpperCase().equals("ARGENTINA")){
                    cantArg++;
                }
                else if (vecBienes[i].getOrigen().toUpperCase().equals("CHINA")){
                    cantChina++;
                }
            }
            if ((dimL / 2) == cantArg){
                aux = this.valorTotalActual() + this.valorTotalActual() * 15;
            }
            else if ((dimL / 2) == cantChina){
                aux = this.valorTotalActual() + this.valorTotalActual() * 5;
            }

            if (super.getMesSolicitud().toUpperCase().equals("FEBRERO")){
                aux = (double) aux + aux*50/100;
            }
        }
        ret = aux < 500000;
        return ret;
    }

    public String toString(){
        String ret;
        ret = "Subsidio de Bienes: " + super.toString();
        for (int i = 0; i<MAXBIENES; i++){
            ret = ret + vecBienes[i].toString();
        }
        if (this.sePuedeOtorgarSubsidio()){
            ret += " El subsidio es otorgable.";
        }
        else {
            ret += " El subsidio no es otorgable.";
        }
        return ret;
    }

}
