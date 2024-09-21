public class Persona {
    private String nombre;
    private double sueldoBasico;
    private int cantCampeonatosGanados; 

    public Persona(String nombre, double sueldoBasico, int cantCampeonatosGanados){
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
        this.cantCampeonatosGanados = cantCampeonatosGanados; 
    }

    public Persona(){

    }

    // Getters Y Setters
    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public int getCantCampeonatosGanados() {
        return cantCampeonatosGanados;
    }

    public String getNombre() {
        return nombre;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public void setCantCampeonatosGanados(int cantCampeonatosGanados) {
        this.cantCampeonatosGanados = cantCampeonatosGanados;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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
        aux = sueldoBasico + adicional;
        return aux;
    }

    // Metodo toString
    public String toString(){
        return "Entrenador: " + nombre + ", Sueldo Básico: " + sueldoBasico + ", Campeonatos Ganados: " + cantCampeonatosGanados;
    }

}
