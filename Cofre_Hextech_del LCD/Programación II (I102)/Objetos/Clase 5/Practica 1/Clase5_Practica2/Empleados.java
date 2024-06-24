/** 1 -  Queremos representar la información de empleados de un club: jugadores y entrenadores. 
	Cualquier empleado se caracteriza por su nombre, DNI, edad y sueldo básico. 
	Los jugadores son empleados que se caracterizan por el número de partidos jugados y el número de goles anotados.
	Los entrenadores son empleados  que se caracterizan por la cantidad de campeonatos ganados.
*/
public abstract class Empleados
{
    private String nombre;
    private int dni,edad;
    private double sueldo;
    
    public Empleados(String nombre, int dni, int edad, double sueldo) {
            this.setNombre(nombre);
            this.setDni(dni);
            this.setEdad(edad);
            this.setSueldo(sueldo);
    }
    
    public Empleados () {
    }
    
    public String getNombre() {
        return nombre;
    }
    public int getDni() {
        return dni;
    }
    
    public int getEdad() {
        return edad;
    }
    
    public double getSueldo() {
        return sueldo;
    }
    
    public void setNombre (String nombre) {
        this.nombre = nombre;
    }
        
    public void setDni (int dni) {
        this.dni= dni;
    }
    
    public void setEdad (int edad) {
        this.edad= edad;
    }
    
    public void setSueldo (double sueldo) {
        this.sueldo= sueldo;
    }
    
    abstract double calcularSueldoACobrar();
        
    public String toString () {
        return ("Mi nombre es" +nombre);
    }
}