import java.awt.EventQueue;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JProgressBar;
import javax.swing.SwingConstants;
import javax.swing.JList;
import javax.swing.ListSelectionModel;
import javax.swing.JRadioButton;
import javax.swing.ButtonGroup;
import javax.swing.JComboBox;
import java.awt.Font;

public class testInterfazMateC {

	private JFrame frmTestLayoutTp;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					testInterfazMateC window = new testInterfazMateC();
					window.frmTestLayoutTp.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public testInterfazMateC() {
		inicializarGUI();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void inicializarGUI() {
		// Ventana Principal
		frmTestLayoutTp = new JFrame();
		frmTestLayoutTp.setTitle("TEST LAYOUT TP MATE C");
		frmTestLayoutTp.setBounds(100, 100, 1000, 720);
		frmTestLayoutTp.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		GridBagLayout gridBagLayout = new GridBagLayout();
		gridBagLayout.columnWidths = new int[]{150, 0, 0, 700, 0};
		gridBagLayout.rowHeights = new int[]{23, 0, 251, 275, 0, 0, 14, 0};
		//gridBagLayout.columnWeights = new double[]{1.0, 1.0, 1.0, 0.0, Double.MIN_VALUE};
		//gridBagLayout.rowWeights = new double[]{0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, Double.MIN_VALUE};
		frmTestLayoutTp.getContentPane().setLayout(gridBagLayout);
		
		// Boton Abrir Imagen
		JButton btnAbrirImg = new JButton("Abrir Imagen");
		GridBagConstraints gbc_btnAbrirImg = new GridBagConstraints();
		gbc_btnAbrirImg.anchor = GridBagConstraints.NORTH;
		gbc_btnAbrirImg.fill = GridBagConstraints.HORIZONTAL;
		gbc_btnAbrirImg.insets = new Insets(0, 0, 5, 5);
		gbc_btnAbrirImg.gridx = 0;
		gbc_btnAbrirImg.gridy = 0;
		frmTestLayoutTp.getContentPane().add(btnAbrirImg, gbc_btnAbrirImg);
		
		JPanel panelOriginales = new JPanel();
		GridBagLayout gbl_panelOriginales = new GridBagLayout();
		gbl_panelOriginales.columnWidths = new int[]{364, 364, 0};
		gbl_panelOriginales.rowHeights = new int[]{23, 0, 0};
		//gbl_panelOriginales.columnWeights = new double[]{0.0, 0.0, Double.MIN_VALUE};
		//gbl_panelOriginales.rowWeights = new double[]{0.0, 0.0, Double.MIN_VALUE};
		panelOriginales.setLayout(gbl_panelOriginales);
		
		JLabel lblImagenOriginal = new JLabel("Imagen Original");
		lblImagenOriginal.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblImagenOriginal.setHorizontalAlignment(SwingConstants.CENTER);
		GridBagConstraints gbc_lblImagenOriginal = new GridBagConstraints();
		gbc_lblImagenOriginal.fill = GridBagConstraints.BOTH;
		gbc_lblImagenOriginal.insets = new Insets(0, 0, 5, 5);
		gbc_lblImagenOriginal.gridx = 0;
		gbc_lblImagenOriginal.gridy = 0;
		panelOriginales.add(lblImagenOriginal, gbc_lblImagenOriginal);
		
		JLabel lblEscalaGrises = new JLabel("Imagen en Escala de Grises");
		lblEscalaGrises.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblEscalaGrises.setHorizontalAlignment(SwingConstants.CENTER);
		GridBagConstraints gbc_lblEscalaGrises = new GridBagConstraints();
		gbc_lblEscalaGrises.insets = new Insets(0, 0, 5, 0);
		gbc_lblEscalaGrises.fill = GridBagConstraints.BOTH;
		gbc_lblEscalaGrises.gridx = 1;
		gbc_lblEscalaGrises.gridy = 0;
		panelOriginales.add(lblEscalaGrises, gbc_lblEscalaGrises);
		
		JLabel placeImgOriginal = new JLabel("");
		GridBagConstraints gbc_placeImgOriginal = new GridBagConstraints();
		gbc_placeImgOriginal.insets = new Insets(0, 0, 0, 5);
		gbc_placeImgOriginal.gridx = 0;
		gbc_placeImgOriginal.gridy = 1;
		panelOriginales.add(placeImgOriginal, gbc_placeImgOriginal);
		placeImgOriginal.setHorizontalAlignment(SwingConstants.CENTER);
		placeImgOriginal.setIcon(new ImageIcon("D:\\Escritorio\\Ultra Nerd\\Programas\\TpMateC\\Imagenes de Prueba\\test3.png"));
		
		JLabel placeImgEscalaGrises = new JLabel("");
		GridBagConstraints gbc_placeImgEscalaGrises = new GridBagConstraints();
		gbc_placeImgEscalaGrises.gridx = 1;
		gbc_placeImgEscalaGrises.gridy = 1;
		panelOriginales.add(placeImgEscalaGrises, gbc_placeImgEscalaGrises);
		placeImgEscalaGrises.setIcon(new ImageIcon("D:\\Escritorio\\Ultra Nerd\\Programas\\TpMateC\\Imagenes de Prueba\\test3.png"));
		placeImgEscalaGrises.setHorizontalAlignment(SwingConstants.CENTER);
		GridBagConstraints gbc_panelOriginales = new GridBagConstraints();
		gbc_panelOriginales.anchor = GridBagConstraints.NORTH;
		gbc_panelOriginales.fill = GridBagConstraints.HORIZONTAL;
		gbc_panelOriginales.insets = new Insets(0, 0, 5, 0);
		gbc_panelOriginales.gridheight = 3;
		gbc_panelOriginales.gridx = 3;
		gbc_panelOriginales.gridy = 0;
		frmTestLayoutTp.getContentPane().add(panelOriginales, gbc_panelOriginales);
		
		JButton btnGuardarImg = new JButton("Guardar Imagen");
		GridBagConstraints gbc_btnGuardarImg = new GridBagConstraints();
		gbc_btnGuardarImg.fill = GridBagConstraints.HORIZONTAL;
		gbc_btnGuardarImg.insets = new Insets(0, 0, 5, 5);
		gbc_btnGuardarImg.gridx = 0;
		gbc_btnGuardarImg.gridy = 1;
		frmTestLayoutTp.getContentPane().add(btnGuardarImg, gbc_btnGuardarImg);
		
		JPanel panelSelectorFiltro = new JPanel();
		GridBagConstraints gbc_panelSelectorFiltro = new GridBagConstraints();
		gbc_panelSelectorFiltro.insets = new Insets(0, 0, 5, 5);
		gbc_panelSelectorFiltro.fill = GridBagConstraints.BOTH;
		gbc_panelSelectorFiltro.gridx = 0;
		gbc_panelSelectorFiltro.gridy = 3;
		frmTestLayoutTp.getContentPane().add(panelSelectorFiltro, gbc_panelSelectorFiltro);
		GridBagLayout gbl_panelSelectorFiltro = new GridBagLayout();
		gbl_panelSelectorFiltro.columnWidths = new int[]{46, 0, 109, 0};
		gbl_panelSelectorFiltro.rowHeights = new int[]{23, 0, 0, 0};
		//gbl_panelSelectorFiltro.columnWeights = new double[]{0.0, 1.0, 0.0, Double.MIN_VALUE};
		//gbl_panelSelectorFiltro.rowWeights = new double[]{0.0, 0.0, 0.0, Double.MIN_VALUE};
		panelSelectorFiltro.setLayout(gbl_panelSelectorFiltro);
		
		JLabel lblSelFiltro = new JLabel("Seleccione un Filtro:");
		GridBagConstraints gbc_lblSelFiltro = new GridBagConstraints();
		gbc_lblSelFiltro.gridwidth = 3;
		gbc_lblSelFiltro.insets = new Insets(0, 0, 5, 0);
		gbc_lblSelFiltro.gridx = 0;
		gbc_lblSelFiltro.gridy = 0;
		panelSelectorFiltro.add(lblSelFiltro, gbc_lblSelFiltro);
		
		JComboBox<String> listaFiltros = new JComboBox<String>();
		GridBagConstraints gbc_comboBox = new GridBagConstraints();
		gbc_comboBox.gridwidth = 3;
		gbc_comboBox.insets = new Insets(0, 0, 5, 5);
		gbc_comboBox.fill = GridBagConstraints.HORIZONTAL;
		gbc_comboBox.gridx = 0;
		gbc_comboBox.gridy = 1;
		panelSelectorFiltro.add(listaFiltros, gbc_comboBox);
		
		listaFiltros.addItem("Filtro 1:");
		listaFiltros.addItem("Filtro 2:");
		listaFiltros.addItem("Filtro 3: Blanco y Negro.");
		
		
		JPanel panelFiltros = new JPanel();
		GridBagConstraints gbc_panelFiltros = new GridBagConstraints();
		gbc_panelFiltros.fill = GridBagConstraints.BOTH;
		gbc_panelFiltros.insets = new Insets(0, 0, 5, 0);
		gbc_panelFiltros.gridx = 3;
		gbc_panelFiltros.gridy = 3;
		frmTestLayoutTp.getContentPane().add(panelFiltros, gbc_panelFiltros);
		GridBagLayout gbl_panelFiltros = new GridBagLayout();
		gbl_panelFiltros.columnWidths = new int[]{329, 71, 0};
		gbl_panelFiltros.rowHeights = new int[]{14, 0, 0};
		//gbl_panelFiltros.columnWeights = new double[]{1.0, 0.0, Double.MIN_VALUE};
		//gbl_panelFiltros.rowWeights = new double[]{0.0, 1.0, Double.MIN_VALUE};
		panelFiltros.setLayout(gbl_panelFiltros);
		
		JLabel lblFiltroAplicado = new JLabel("Filtro Aplicado:");
		lblFiltroAplicado.setFont(new Font("Tahoma", Font.BOLD, 14));
		GridBagConstraints gbc_lblFiltroAplicado = new GridBagConstraints();
		gbc_lblFiltroAplicado.gridwidth = 2;
		gbc_lblFiltroAplicado.insets = new Insets(0, 0, 5, 0);
		gbc_lblFiltroAplicado.anchor = GridBagConstraints.NORTH;
		gbc_lblFiltroAplicado.gridx = 0;
		gbc_lblFiltroAplicado.gridy = 0;
		panelFiltros.add(lblFiltroAplicado, gbc_lblFiltroAplicado);
		
		JLabel placeImgFiltroAplicado = new JLabel("");
		placeImgFiltroAplicado.setIcon(new ImageIcon("D:\\Escritorio\\Ultra Nerd\\Programas\\TpMateC\\Imagenes de Prueba\\test3.png"));
		GridBagConstraints gbc_placeImgFiltroAplicado = new GridBagConstraints();
		gbc_placeImgFiltroAplicado.gridwidth = 2;
		gbc_placeImgFiltroAplicado.gridx = 0;
		gbc_placeImgFiltroAplicado.gridy = 1;
		panelFiltros.add(placeImgFiltroAplicado, gbc_placeImgFiltroAplicado);
		
		JProgressBar progressBar = new JProgressBar();
		GridBagConstraints gbc_progressBar = new GridBagConstraints();
		gbc_progressBar.gridwidth = 4;
		gbc_progressBar.anchor = GridBagConstraints.SOUTH;
		gbc_progressBar.fill = GridBagConstraints.HORIZONTAL;
		gbc_progressBar.insets = new Insets(0, 0, 5, 0);
		gbc_progressBar.gridx = 0;
		gbc_progressBar.gridy = 5;
		frmTestLayoutTp.getContentPane().add(progressBar, gbc_progressBar);
		
		JLabel lblEstadoActual = new JLabel("Aplicación Iniciada con Exito.");
		GridBagConstraints gbc_lblEstadoActual = new GridBagConstraints();
		gbc_lblEstadoActual.anchor = GridBagConstraints.NORTH;
		gbc_lblEstadoActual.fill = GridBagConstraints.HORIZONTAL;
		gbc_lblEstadoActual.gridwidth = 4;
		gbc_lblEstadoActual.gridx = 0;
		gbc_lblEstadoActual.gridy = 6;
		frmTestLayoutTp.getContentPane().add(lblEstadoActual, gbc_lblEstadoActual);
	}

}
