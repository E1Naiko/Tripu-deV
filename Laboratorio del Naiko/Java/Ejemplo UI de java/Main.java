import javax.swing.SwingUtilities;

// Main.java
public class Main {
    public static void main(String[] args) {
        // invokeLater garantiza que la creación y manipulación de la interfaz gráfica
        // se ejecute en el Event Dispatch Thread (EDT), el único hilo autorizado para gestionar componentes Swing.
        SwingUtilities.invokeLater(() -> {
            ModeloCalculadora modelo = new ModeloCalculadora();
            VistaCalculadora vista = new VistaCalculadora();
            new ControladorCalculadora(modelo, vista);
        });
    }
}