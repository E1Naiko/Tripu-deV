public class Entrenador extends Empleados{
    private int cantCampeonatosGanados; 

    public Entrenador(int DNI, String nombre, int edad, double sueldoBasico, int cantCampeonatosGanados){
        super(DNI, nombre, edad, sueldoBasico);
        this.cantCampeonatosGanados = cantCampeonatosGanados; 
    }

    public Entrenador(){

    }

    // Getters Y Setters
    public int getCantCampeonatosGanados() {
        return cantCampeonatosGanados;
    }

    public void setCantCampeonatosGanados(int cantCampeonatosGanados) {
        this.cantCampeonatosGanados = cantCampeonatosGanados;
    }

    // Metodos Publicos
    public double calcularSueldoACobrar(){
        double aux;
        int adicional;
        if (cantCampeonatosGanados <= 0) {
            adicional = 0;
        }
        else if (cantCampeonatosGanados <= 4) {
            adicional = 5000;
        }
        else if (cantCampeonatosGanados <= 10) {
            adicional = 30000;
        }
        else {
            adicional = 50000;
        }
        aux = super.getSueldoBasico() + adicional;
        return aux;
    }

    // Metodo toString
    public String toString(){ // ACTUALIZAR
        return "Entrenador: " + 
        super.toString() +
        ", Campeonatos Ganados: " + cantCampeonatosGanados +
        ", Sueldo Real: " + this.calcularSueldoACobrar();
    }

}
