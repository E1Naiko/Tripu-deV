
public class Micro  
{
    private String patente; 
    private String horasalida;
    private String destino;
    private boolean[] cantasiento;
    private int cantnumasie;
    
    public Micro(String patente, String destino, String hora) {
        this.patente = patente;
        this.destino = destino;
        this.horasalida = hora;
        this.cantasiento= new boolean[20];
        this.cantnumasie= 0;
    }
    // Constructor
    public Micro (){
        
    }
    
    // Getters y getters
    public  String getPatente(){
        return patente;
    }
    
    public  String getDestino(){
        return destino;
    }
    
    public  String getHorasalida(){
        return horasalida;
    }
    
    public void setPatente(String patente){
        this.patente= patente ;
    }
    
    public void setDestino(String destino){
        this.destino= destino ;
    }
    
    public void setHorasalida(String horasalida){
        this.horasalida= horasalida;
    }
    
    //Metodos
    // I-) Devolver la cantidad de asientos ocupados.
    public int getCantnumasie () {
        return cantnumasie; 
    }
    
    // II-) Devolver si el micro está lleno.
    public boolean estalleno () {
        return cantnumasie == 20;
    }
    
    // III-) Validar un número de asiento recibido como parámetro.
    public boolean validarasiento (int numasiento) {
        return numasiento >= 1 && numasiento <= 20;
    }
    
    // IV-) Ocupar un nro. de asiento válido recibido como parámetro.
    public boolean ocuparasiento (int numasiento) {
        if (validarasiento(numasiento) && !cantasiento[numasiento - 1]){
            cantasiento[numasiento - 1]= true;
            cantnumasie ++;
            return true;
        }
        return false;
    }
    
    // V-) Liberar un nro. de asiento válido recibido como parámetro.
    public boolean liberarasiento (int numasiento) {
        if (validarasiento(numasiento) && cantasiento[numasiento - 1]){
            cantasiento[numasiento - 1]= false;
            cantnumasie --;
            return false;
        }
        return true;
    }
    
    // VI-) Devolver el nro. del primer asiento libre.
    public int devolverasiento () {
        int i;
        for (i=0; i<19; i++) {
            if (!cantasiento[i]) {
                return i+1;
            }
        }
        return -1;
    }
}
    