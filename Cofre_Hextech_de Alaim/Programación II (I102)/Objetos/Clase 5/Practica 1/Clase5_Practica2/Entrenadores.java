/**. 
Los jugadores son empleados que se caracterizan 
 por el número de partidos jugados y el número de goles anotados.
	
*/
public class Entrenadores extends Empleados
{
    private int campeonatosganados;
    
    public Entrenadores(int campeonatosganados, String nombre, int dni, int edad, double sueldo) {
            super(nombre,dni,edad,sueldo);
            this.campeonatosganados= campeonatosganados;
    }
    
    public Entrenadores () {
    }
    
    public int getCampeonatosganados() {
        return campeonatosganados;
    }
    
    public void setCampeonatosganados (int campeonatosganados) {
        this.campeonatosganados= campeonatosganados;
    }
    
    public double calcularSueldoACobrar (){
        if ((campeonatosganados >= 1) && (campeonatosganados <=4)) {
            return super.getSueldo() + 5000;   
        } else {
            if ((campeonatosganados >= 5) && (campeonatosganados <=10)) {
                return super.getSueldo() + 30000;
            }   else {
                    if ((campeonatosganados <10)) {
                        return super.getSueldo() + 50000;
                    }
            }   
        }
        return super.getSueldo();
    }
    
    public String toString () {
        return super.toString()+ " soy entrenador y cobro " +calcularSueldoACobrar()+ " pesos";
    }
}