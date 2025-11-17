import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

// ControladorCalculadora.java
public class ControladorCalculadora implements ActionListener {

    private ModeloCalculadora modelo;
    private VistaCalculadora vista;

    public ControladorCalculadora(ModeloCalculadora modelo, VistaCalculadora vista) {
        this.modelo = modelo;
        this.vista = vista;
        
        // Conecta el botón de la Vista a este listener de acción del controlador.
        vista.getBotonCalcular().addActionListener(this);
    }

    @Override
    public void actionPerformed(ActionEvent evento) {
        // Solo responde si el botón Calcular fue presionado
        System.out.println("Controlador - Botón apretado");
        if (evento.getSource() == vista.getBotonCalcular()) {
            calcularSuma();
        }
    }

    private void calcularSuma() {
        System.out.println("Calcular Suma");
        String texto1 = vista.getEntrada1();
        String texto2 = vista.getEntrada2();
        
        if (texto1.isEmpty() || texto2.isEmpty()) {
            vista.setResultado("Error! Por favor ingrese dos números.");
            return;
        }

        try {
            // El controlador maneja el análisis y la validación
            int numero1 = Integer.parseInt(texto1);
            int numero2 = Integer.parseInt(texto2);
            
            // El controlador usa el modelo para realizar la lógica
            int suma = modelo.sumar(numero1, numero2);

            // actualizo el panel de estado
            vista.setEstado(modelo.txtSumar(numero1, numero2));
            
            // El controlador actualiza la vista
            vista.setResultado(String.valueOf(suma));
            
        } catch (NumberFormatException excepcion) {
            // El controlador maneja la visualización del error
            vista.setResultado("Error! Las entradas deben ser enteros válidos.");
        }
    }
}