/**. 
Los jugadores son empleados que se caracterizan 
 por el número de partidos jugados y el número de goles anotados.
	
*/
public class Jugadores extends Empleados {
    private int partidosjugados,goles;
    
    //Constructor
    public Jugadores(int partidosjugados,String nombre, int goles, int dni, int edad, double sueldo) {
            super(nombre,dni,edad,sueldo);
            this.setPartidosjugados(partidosjugados);
            this.setGoles(goles);
    }
    
    public Jugadores () {
    }
    
    // Getters y setters
    public int getPartidosjugados() {
        return partidosjugados;
    }
    
    public int getGoles() {
        return goles;
    }
    
    public void setPartidosjugados (int partidosjugados) {
        this.partidosjugados= partidosjugados;
    }
    
    public void setGoles (int goles) {
        this.goles= goles;
    }
    
    public double calcularSueldoACobrar () {
        double prom= 0;
        prom=   ((double )goles/partidosjugados);
        if (prom <= 0.5) {
            return super.getSueldo() * 2;
        }
        return super.getSueldo();
    }
    
    public String toString () {
        return super.toString() + " soy jugador y cobro sueldo " +calcularSueldoACobrar()+ " pesos";
    }
}