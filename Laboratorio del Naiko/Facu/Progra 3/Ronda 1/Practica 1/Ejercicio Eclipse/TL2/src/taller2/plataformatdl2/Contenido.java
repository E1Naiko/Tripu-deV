package taller2.plataformatdl2;

/**
 * Clase que representa un contenido en la plataforma de streaming.
 * Contiene calidad, audio y direccion archivo.
 * 
 * @author Alam Meza y Nicolas Peñalba
 * @version 1.0 - 2025-09-15
 */

 public abstract class Contenido {
    protected String calidad;
    protected String audio;
    protected String direccionArchivo;

    /**
     * Constructor de la clase Contenido.
     * 
     * @param calidad          La calidad del contenido (e.g., HD, 4K).
     * @param audio            El tipo de audio del contenido (e.g., Stereo, Dolby).
     * @param direccionArchivo La dirección de archivo.
     */

    public Contenido(String calidad, String audio, String direccionArchivo) {
        this.calidad = calidad;
        this.audio = audio;
        this.direccionArchivo = direccionArchivo;
    }

    // --- Getters y Setters ---

    public String getCalidad() {
        return calidad;
    }

    public void setCalidad(String calidad) {
        this.calidad = calidad;
    }

    public String getAudio() {
        return audio;
    }

    public void setAudio(String audio) {
        this.audio = audio;
    }

    public String getDireccionMetadato() {
        return direccionArchivo;
    }

    public void setDireccionMetadato(String direccionArchivo) {
        this.direccionArchivo = direccionArchivo;
    }
 }