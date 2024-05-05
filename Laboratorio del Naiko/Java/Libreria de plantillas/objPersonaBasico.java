public class objPersonaBasico
{
    private String nombre;
    private String apellido;
    private int edad;
    private int dni;
    private int cuit;
    
    private double sueldoBasico;
    
    // Constructor
    public objPersonaBasico (String nombre, String apellido, int edad, int dni, int cuit){
        this.setNombre(nombre);
        this.setApellido(apellido);
        this.setEdad(edad);
        this.setDni(dni);
        this.setCuit(cuit);
    }
    
    public objPersonaBasico (){
        
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public String getApellido(){
        return apellido;
    }
    
    public int getEdad(){
        return edad;
    }
    
    public int getDni(){
        return dni;
    }
    
    public int getCuit(){
        return cuit;
    }
    
    public double getSueldoBasico(){
        return sueldoBasico;
    }
    
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    
    public void setApellido(String apellido){
        this.apellido = apellido;
    }
    
    public void setEdad(int edad){
        this.edad = edad;
    }
    
    public void setDni(int dni){
        this.dni = dni;
    }
    
    public void setCuit(int cuit){
        this.cuit = cuit;
    }
    
    public void setSueldoBasico(double sueldoBasico){
        this.sueldoBasico = sueldoBasico;
    }
    
    public String toString(){
        return "Nombre: " + nombre +
        ", Apellido: " + apellido +
        ", Edad: " + edad +
        ", DNI: " + dni +
        ", CUIT: " + cuit +
        ", Sueldo Basico: " + sueldoBasico;
    }
    
}
