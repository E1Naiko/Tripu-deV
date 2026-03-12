package taller2.plataformatdl2;

/**
 * Clase que representa un usuario de la plataforma de streaming.   
 * Contiene atributos como nombre, email y lista de contenidos vistos.
 * 
 * @author Alam Meza y Nicolas Peñalba
 * @version 1.0 - 2025-09-15
 */

public abstract class Usuario {
    protected String nombre;
    protected String email;
    protected String contrasena;

    /**
     * Constructor de la clase Usuario.
     * 
     * @param nombre    El nombre del usuario.
     * @param email     El email del usuario.
     * @param contrasena La contraseña del usuario.
     */

    public Usuario(String nombre, String email, String contrasena) {
        this.nombre = nombre;
        this.email = email;
        this.contrasena = contrasena;
    }

    // --- Getters y Setters ---

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    // --- Metodos especificos ---

    public boolean login() {
        // Logica de login..
        return true;
    }
    
}
