public abstract class Empleados
{
    private int DNI;
    private String nombre;
    private int edad;
    private double sueldoBasico;

    // Constructor
    public Empleados (int DNI, String nombre, int edad, double sueldoBasico){
        this.setDNI(DNI);
        this.setNombre(nombre);
        this.setEdad(edad);
        this.setSueldoBasico(sueldoBasico);
    }

    public Empleados (){

    }

    public int getDNI(){
        return DNI;
    }

    public int getEdad(){
        return edad;
    }

    public double getSueldoBasico(){
        return sueldoBasico;
    }
    
    public String getNombre(){
        return nombre;
    }

    public void setDNI(int DNI){
        this.DNI = DNI;
    }

    public void setEdad(int edad){
        this.edad = edad;
    }

    public void setSueldoBasico(double sueldoBasico){
        this.sueldoBasico = sueldoBasico;
    }
    
    public void setNombre(String nombre){
        this.nombre = nombre;
    }

    public String toString(){ // ACTUALIZAR
        return " DNI: " + DNI +
        ", Nombre: " + nombre +
        ", Edad: " + edad +
        ", Sueldo Basico: " + sueldoBasico;
    }

    public abstract double calcularSueldoACobrar();

}
