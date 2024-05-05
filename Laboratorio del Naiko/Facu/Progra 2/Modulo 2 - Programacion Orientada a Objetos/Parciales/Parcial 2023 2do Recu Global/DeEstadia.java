/*
 * De Estadía, de este tipo de subsidio se registra lugar de destino, si el traslado
 * es en avión o en micro, el costo en pasajes, la cantidad de días de estadía
 * y el monto de hotel por día.
*/
public class DeEstadia extends Subsidio
{
    private String lugarDeDestino;
    private String tipoDeTraslado;
    private double costoPasajes;
    private int cantDiasEstadia;
    private double montoHotelXDia;
    
    // Constructor
    public DeEstadia(String nombrePlanTrabajo, int diaSolicitud, String mesSolicitud,
    int añoSolicitud, int cuit, String nombre, String apellido, String lugarDeDestino,
    String tipoDeTraslado, double costoPasajes, int cantDiasEstadia, double montoHotelXDia){
        
        super(nombrePlanTrabajo, diaSolicitud, mesSolicitud, añoSolicitud, cuit, nombre, apellido);
        this.setTipoDeTraslado(tipoDeTraslado);
        this.setLugarDeDestino(lugarDeDestino);
        this.setCostoPasajes(costoPasajes);
        this.setCantDiasEstadia(cantDiasEstadia);
        this.setMontoHotelXDia(montoHotelXDia);
    }
    
    public DeEstadia(String lugarDeDestino, String tipoDeTraslado,
    double costoPasajes, int cantDiasEstadia, double montoHotelXDia){
        this.setTipoDeTraslado(tipoDeTraslado);
        this.setLugarDeDestino(lugarDeDestino);
        this.setCostoPasajes(costoPasajes);
        this.setCantDiasEstadia(cantDiasEstadia);
        this.setMontoHotelXDia(montoHotelXDia);
    }
    
    // Getters y Setters
    public String getLugarDeDestino(){
        return lugarDeDestino;
    }
    
    public String getTipoDeTraslado(){
        return tipoDeTraslado;
    }
    
    public double getCostoPasajes(){
        return costoPasajes;
    }
    
    public int getCantDiasEstadia(){
        return cantDiasEstadia;
    }
    
    public double getMontoHotelXDia(){
        return montoHotelXDia;
    }
    
    public void setLugarDeDestino(String lugarDeDestino){
        this.lugarDeDestino = lugarDeDestino;
    }
    
    public void setTipoDeTraslado(String tipoDeTraslado){
        this.tipoDeTraslado = tipoDeTraslado;
    }
    
    public void setCostoPasajes(double costoPasajes){
        this.costoPasajes = costoPasajes;
    }
    
    public void setCantDiasEstadia(int cantDiasEstadia){
        this.cantDiasEstadia = cantDiasEstadia;
    }
    
    public void setMontoHotelXDia(double montoHotelXDia){
        this.montoHotelXDia = montoHotelXDia;
    }
    
    public boolean sePuedeOtorgarSubsidio(){
        boolean ret = false;
        double aux = 0;
        if (this.getTipoDeTraslado().toUpperCase().equals("AVION")){
            aux = (double) this.getCostoPasajes() + this.getCostoPasajes()*45/100;
            if (this.getCantDiasEstadia()>5) {
                aux += 65000;
            }
            else {
                aux += this.getMontoHotelXDia()*this.getCantDiasEstadia();
            }
            if (super.getMesSolicitud().toUpperCase().equals("FEBRERO")){
                aux = (double) aux + aux*5/10;
            }
        }
        else if (this.getTipoDeTraslado().toUpperCase().equals("MICRO")){
            aux = (double) this.getCostoPasajes() + this.getCostoPasajes()*20/100;
            
        }
        ret = aux < 500000;
        return ret;
    }
    
    public String toString(){
        String ret = "Subsidio de Estadia: " + super.toString() +
        ", Lugar de Destino: " + lugarDeDestino +
        ", Tipo de Translado: " + tipoDeTraslado +
        ", Costo de Pasajes: " + costoPasajes +
        ", Cantidad de Dias de Estadia: " + cantDiasEstadia +
        ", Monto de Hotel Por Dia: " + montoHotelXDia + ", ";
        if (this.sePuedeOtorgarSubsidio()){
            ret += " El subsidio es otorgable.";
        }
        else {
            ret += " El subsidio no es otorgable.";
        }
        return ret;
    }
    
}
