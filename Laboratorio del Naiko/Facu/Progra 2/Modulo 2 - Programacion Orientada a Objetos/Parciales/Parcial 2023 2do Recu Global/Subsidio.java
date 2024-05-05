/*
 * La UNLP maneja la información de los subsidios solicitados por sus investigadores.
 * De cada subsidio se conoce: el nombre del plan de trabajo, la fecha de la solicitud
 * (día, mes y año), y del investigador, su CUIT junto a su nombre y apellido.
 */
public abstract class Subsidio
{
    // Para Subsidio
    private String nombrePlanTrabajo;
    private int diaSolicitud;
    private String mesSolicitud;
    private int añoSolicitud;

    // Para Investigador
    private int cuit;
    private String nombre;
    private String apellido;

    // Constructor
    public Subsidio (String nombrePlanTrabajo, int diaSolicitud, String mesSolicitud, 
    int añoSolicitud, int cuit, String nombre, String apellido){
        this.setNombrePlanTrabajo(nombrePlanTrabajo);
        this.setDiaSolicitud(diaSolicitud);
        this.setMesSolicitud(mesSolicitud);
        this.setAñoSolicitud(añoSolicitud);
        this.setCuit(cuit);
        this.setNombre(nombre);
        this.setApellido(apellido);
    }

    public Subsidio (){

    }

    // Getters y Setters
    public String getNombrePlanTrabajo(){
        return nombrePlanTrabajo;
    }

    public int getDiaSolicitud(){
        return diaSolicitud;
    }
    
    public String getMesSolicitud(){
        return mesSolicitud;
    }
    
    public int getAñoSolicitud(){
        return añoSolicitud;
    }

    public int getCuit(){
        return cuit;
    }

    public String getNombre(){
        return nombre;
    }

    public String getApellido(){
        return apellido;
    }

    public void setNombrePlanTrabajo(String nombrePlanTrabajo){
        this.nombrePlanTrabajo = nombrePlanTrabajo;
    }

    public void setDiaSolicitud(int diaSolicitud){
        this.diaSolicitud = diaSolicitud;
    }
    
    public void setMesSolicitud(String mesSolicitud){
        this.mesSolicitud = mesSolicitud;
    }
    
    public void setAñoSolicitud(int añoSolicitud){
        this.añoSolicitud = añoSolicitud;
    }

    public void setCuit(int cuit){
        this.cuit = cuit;
    }

    public void setNombre(String nombre){
        this.nombre = nombre;
    }

    public void setApellido(String apellido){
        this.apellido = apellido;
    }

    public String toString(){
        return "";
    }
    
    public abstract boolean sePuedeOtorgarSubsidio();

}
