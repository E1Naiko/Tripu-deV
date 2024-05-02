public class Jugador extends Empleados
{
    private int numPartidosJugados;
    private int numGolesAnotados;

    // Constructor
    public Jugador (int DNI, String nombre, int edad, double sueldoBasico,
    int numPartidosJugados, int numGolesAnotados){
        super(DNI, nombre, edad, sueldoBasico);
        this.setNumGolesAnotados(numGolesAnotados);
        this.setNumPartidosJugados(this.numPartidosJugados);
    }

    public Jugador (){

    }

    public int getNumPartidosJugados(){
        return numPartidosJugados;
    }

    public int getNumGolesAnotados(){
        return numGolesAnotados;
    }

    public void setNumPartidosJugados(int numPartidosJugados){
        this.numPartidosJugados = numPartidosJugados;
    }

    public void setNumGolesAnotados(int numGolesAnotados){
        this.numGolesAnotados = numGolesAnotados;
    }

    public double calcularSueldoACobrar(){
        double aux = 0;
        if ((double) numGolesAnotados / numPartidosJugados >= 0.5) {
            aux = super.getSueldoBasico();
        }

        return aux + super.getSueldoBasico();
    }

    public String toString(){ // ACTUALIZAR
        return "Jugador: " + super.toString() +
        ", Numero de Partidos Jugados: " + numPartidosJugados +
        ", Numero de Goles Anotados: " + numGolesAnotados +
        ", Sueldo Real: " + this.calcularSueldoACobrar();
    }

}
