import javax.swing.*;
import java.awt.*;

public class VistaCalculadora extends JFrame {

    // Componentes controlados:
    private JTextField campoEntrada1;
    private JTextField campoEntrada2;
    private JButton botonCalcular;
    private JLabel etiquetaResultado;
    private JLabel etiquetaEstado;

    public VistaCalculadora() {
        // --- Configuración de la ventana ---
        setTitle("Sumanteros");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout(10, 10));

        // --- Panel de entrada (CENTRO) ---
        JPanel panelEntrada = new JPanel(new GridLayout(3, 2, 10, 10));
        panelEntrada.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        campoEntrada1 = new JTextField(10);
        campoEntrada2 = new JTextField(10);

        panelEntrada.add(new JLabel("N°1:", SwingConstants.RIGHT));
        panelEntrada.add(campoEntrada1);
        panelEntrada.add(new JLabel("N°2:", SwingConstants.RIGHT));
        panelEntrada.add(campoEntrada2);

        // --- Etiqueta de resultado (NORTE) ---
        etiquetaResultado = new JLabel("Resultado: Listo", SwingConstants.CENTER);
        etiquetaResultado.setFont(new Font("SansSerif", Font.BOLD, 16));
        etiquetaResultado.setBorder(BorderFactory.createEmptyBorder(10, 0, 0, 0));
        
        // --- Panel inferior que combina botón y estado (SUR) ---
        JPanel panelInferior = new JPanel(new BorderLayout());
        
        // Botón
        botonCalcular = new JButton("Sumar Números");
        JPanel panelBoton = new JPanel(new FlowLayout(FlowLayout.CENTER));
        panelBoton.add(botonCalcular);
        
        // Etiqueta de estado
        etiquetaEstado = new JLabel("Programa Iniciado", SwingConstants.CENTER);
        etiquetaEstado.setBorder(BorderFactory.createEmptyBorder(5, 10, 5, 10));
        etiquetaEstado.setForeground(Color.GRAY);
        
        // Agregar al panel inferior
        panelInferior.add(panelBoton, BorderLayout.CENTER);
        panelInferior.add(etiquetaEstado, BorderLayout.SOUTH);
        
        // --- Agregar componentes a la ventana ---
        add(etiquetaResultado, BorderLayout.NORTH);
        add(panelEntrada, BorderLayout.CENTER);
        add(panelInferior, BorderLayout.SOUTH);

        pack();
        setLocationRelativeTo(null);
        setVisible(true);
    }

    // --- Métodos de acceso para el Controlador ---

    public String getEntrada1() {
        return campoEntrada1.getText().trim();
    }

    public String getEntrada2() {
        return campoEntrada2.getText().trim();
    }

    public void setResultado(String texto) {
        this.etiquetaResultado.setText("Resultado: " + texto);
    }
    
    public JButton getBotonCalcular() {
        return botonCalcular;
    }

    public void setEstado(String texto) {
        this.etiquetaEstado.setText(texto);
    }
    
    // Métodos adicionales útiles
    public void limpiarCampos() {
        campoEntrada1.setText("");
        campoEntrada2.setText("");
    }
    
    public void mostrarError(String mensaje) {
        JOptionPane.showMessageDialog(this, mensaje, "Error", JOptionPane.ERROR_MESSAGE);
    }
}