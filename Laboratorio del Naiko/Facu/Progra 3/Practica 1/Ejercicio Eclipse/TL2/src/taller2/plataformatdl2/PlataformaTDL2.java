package taller2.plataformatdl2;

import java.util.ArrayList;
import java.util.List;

/**
 * Clase principal que representa la plataforma de streaming.
 * Esta clase maneja los usuarios y el catálogo de contenidos.
 * 
 * @author Alam Meza y Nicolas Peñalba
 * @version 1.0 - 2025-09-15
 */

public class PlataformaTDL2 {
    private List<Usuario> usuarios;
    private List<Contenido> catalogo;

    /**
     * Constructor de la clase PlataformaTLD2.
     * Inicializa las listas de usuarios y catálogo.
     */

    public PlataformaTDL2() {
        this.usuarios = new ArrayList<>();
        this.catalogo = new ArrayList<>();
    }

    // --- Getters y Setters ---

    public List<Usuario> getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(List<Usuario> usuarios) {
        this.usuarios = usuarios;
    }

    public List<Contenido> getCatalogo() {
        return catalogo;
    }

    public void setCatalogo(List<Contenido> catalogo) {
        this.catalogo = catalogo;
    }

    // --- Métodos para manejar usuarios y catálogo ---

    /**
     * Busca un usuario en la plataforma a traves del email.
     * 
     * @param email El email a buscar.
     * @return El usuario si se encuentra, null en caso contrario.
     */
    public Usuario buscarUsuario(String email) {
        // Logica de busqueda..
        return null;
    }

    public Contenido buscarContenido(String titulo) {
        // Logica de busqueda..
        return null;
    }

    public void registrarUsuario(Usuario usuario) {
        // Logica de registro de usuario..
    }

    public void agregarContenido(Contenido contenido) {
        // Logica para agregar contenido al catalogo..
    }
}