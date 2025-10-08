package taller2.plataformatdl2;

/**
 * Clase que representa un administrador de la plataforma de streaming.
 * Contiene atributos y métodos específicos para la gestión de la plataforma.
 * 
 * @author Alam Meza y Nicolas Peñalba
 * @version 1.0 - 2025-09-15
 * @see Usuario
 */

 public class Administrador extends Usuario {
    private String codigoAdmin;

    /**
     * Constructor de la clase Administrador.
     * 
     * @param nombre      El nombre del administrador.
     * @param email       El email del administrador.
     * @param contrasena  La contraseña del administrador.
     * @param codigoAdmin El código de administrador.
     */

    public Administrador(String nombre, String email, String contrasena, String codigoAdmin) {
        super(nombre, email, contrasena);
        this.codigoAdmin = codigoAdmin;
    }

    // --- Getters y Setters ---

    public String getCodigoAdmin() {
        return codigoAdmin;
    }

    public void setCodigoAdmin(String codigoAdmin) {
        this.codigoAdmin = codigoAdmin;
    }

    // --- Métodos específicos del administrador ---

    /**
     * Añade un nuevo contenido a la plataforma.
     *
     * @param cont El contenido a agregar.
     * @param plataforma La instancia de la plataforma donde se agregará.
     * @return true si la operación fue exitosa, de lo contrario false.
     * @see PlataformaTDL2
     */

    public boolean agregarContenido(Contenido cont, PlataformaTDL2 plataforma) {
        // Lógica para agregar contenido al catálogo de la plataforma.
        return true;
    }
    
    public boolean eliminarContenido(Contenido cont) {
        // Lógica para eliminar contenido del catálogo de la plataforma.
        return true;
    }

    public boolean modificarContenido(Contenido cont) {
        // Lógica para modificar contenido del catálogo de la plataforma.
        return true;
    }
 }