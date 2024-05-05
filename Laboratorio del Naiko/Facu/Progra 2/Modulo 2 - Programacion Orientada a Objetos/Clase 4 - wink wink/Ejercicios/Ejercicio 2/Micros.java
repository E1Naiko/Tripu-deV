public class Micros
{
    private String patente;
    private String destino;
    private String horaSalida;
    private int cantidadAsientos;
    private boolean [] vecOcupados; // vector completo no se comprime
    private int cantidadAsientosOcupados;

    // Constructor
    public Micros (String patente, String destino, String horaSalida){
        cantidadAsientos = 20;
        cantidadAsientosOcupados = 0;
        vecOcupados = new boolean[cantidadAsientos];
        for (int i=0; i<cantidadAsientos; i++){
            vecOcupados[i] = false;
        }
        this.patente = patente;
        this.destino = destino;
        this.horaSalida = horaSalida;
    }

    public Micros(){

    }

    // Metodos Particulares
    public int devCantidadAsientosOcupados(){ // i)
        return cantidadAsientosOcupados;
    }

    public boolean microLleno(){ // ii)
        boolean aux;
        aux = (cantidadAsientosOcupados == cantidadAsientos);
        return aux;
    }

    // PREGUNTAR
    public boolean validarNumeroAsiento(int numero) { // asiento en rango
        return ((numero >= 1) && (numero <= cantidadAsientos) && (!vecOcupados[numero - 1]));
    }

    public boolean devolverEstadoAsiento(int numero){
        boolean aux = false;
        if (this.validarNumeroAsiento(numero)){
            aux = vecOcupados[numero];
        }
        return aux;
    }
    
    public boolean ocuparAsiento(int numero){ // v)
        boolean sePudo = false;
        if ((!this.microLleno()) && (!this.validarNumeroAsiento(numero)) && (this.devolverEstadoAsiento(numero))){
            vecOcupados[numero] = true;
            sePudo = true;
            cantidadAsientosOcupados++;
        }
        return sePudo;
    }

    public boolean liberarAsiento(int numero){ // vi
        boolean sePudo = false;
        if ((numero >= 0) && (numero < cantidadAsientosOcupados)){
            vecOcupados[numero] = false;
            sePudo = true;
            cantidadAsientosOcupados--;
        }
        return sePudo;
    }

    public int devolverPrimerAsientoLibre() {
        for (int i = 0; i < cantidadAsientos; i++) {
            if (!vecOcupados[i]) {
                return i + 1;
            }
        }
        return -1; // Si no hay asientos libres
    }

    // Getters y Setters
    public String getPatente(){
        return patente;
    }

    public String getDestino(){
        return destino;
    }

    public String getHoraSalida(){
        return horaSalida;
    }

    public void setPatente(String patente){
        this.patente = patente;
    }

    public void setDestino(String destino){
        this.destino = destino;
    }

    public void setHoraSalida(String horaSalida){
        this.horaSalida = horaSalida;
    }

    // ToString
    public String toString(){
        return "";
    }

}