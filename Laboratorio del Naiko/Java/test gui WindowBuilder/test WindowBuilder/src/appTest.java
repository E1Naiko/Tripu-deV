import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JToolBar;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.JPanel;
import javax.swing.JProgressBar;
import javax.swing.JTextField;
import java.awt.FlowLayout;
import javax.swing.BoxLayout;
import javax.swing.SwingConstants;
import com.jgoodies.forms.layout.FormLayout;
import com.jgoodies.forms.layout.ColumnSpec;
import com.jgoodies.forms.layout.RowSpec;
import net.miginfocom.swing.MigLayout;
import javax.swing.JPopupMenu;
import java.awt.Component;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.ImageIcon;
import java.awt.GridLayout;
import java.awt.GridBagLayout;
import java.awt.GridBagConstraints;
import java.awt.Insets;
import javax.swing.JList;
import javax.swing.ListSelectionModel;
import javax.swing.JToggleButton;

public class appTest {

	private JFrame frmTestLayoutTp;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					appTest window = new appTest();
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
	public appTest() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frmTestLayoutTp = new JFrame();
		frmTestLayoutTp.setTitle("TEST LAYOUT TP MATE C");
		frmTestLayoutTp.setBounds(100, 100, 656, 387);
		frmTestLayoutTp.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		GridBagLayout gridBagLayout = new GridBagLayout();
		gridBagLayout.columnWidths = new int[]{146, 729, 0};
		gridBagLayout.rowHeights = new int[]{23, 0, 251, 275, 14, 0};
		gridBagLayout.columnWeights = new double[]{0.0, 0.0, Double.MIN_VALUE};
		gridBagLayout.rowWeights = new double[]{0.0, 0.0, 0.0, 0.0, 0.0, Double.MIN_VALUE};
		frmTestLayoutTp.getContentPane().setLayout(gridBagLayout);
		
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
		gbl_panelOriginales.columnWeights = new double[]{0.0, 0.0, Double.MIN_VALUE};
		gbl_panelOriginales.rowWeights = new double[]{0.0, 0.0, Double.MIN_VALUE};
		panelOriginales.setLayout(gbl_panelOriginales);
		
		JLabel lblImagenOriginal = new JLabel("Imagen Original");
		lblImagenOriginal.setHorizontalAlignment(SwingConstants.CENTER);
		GridBagConstraints gbc_lblImagenOriginal = new GridBagConstraints();
		gbc_lblImagenOriginal.fill = GridBagConstraints.BOTH;
		gbc_lblImagenOriginal.insets = new Insets(0, 0, 5, 5);
		gbc_lblImagenOriginal.gridx = 0;
		gbc_lblImagenOriginal.gridy = 0;
		panelOriginales.add(lblImagenOriginal, gbc_lblImagenOriginal);
		
		JLabel lblEscalaGrises = new JLabel("Imagen en Escala de Grises");
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
		placeImgOriginal.setIcon(new ImageIcon("C:\\Users\\Adm\\3D Objects\\NICOLAS\\TpMateC\\Imagenes de Prueba\\test3.png"));
		
		JLabel placeImgEscalaGrises = new JLabel("");
		GridBagConstraints gbc_placeImgEscalaGrises = new GridBagConstraints();
		gbc_placeImgEscalaGrises.gridx = 1;
		gbc_placeImgEscalaGrises.gridy = 1;
		panelOriginales.add(placeImgEscalaGrises, gbc_placeImgEscalaGrises);
		placeImgEscalaGrises.setIcon(new ImageIcon("C:\\Users\\Adm\\3D Objects\\NICOLAS\\TpMateC\\Imagenes de Prueba\\test3.png"));
		placeImgEscalaGrises.setHorizontalAlignment(SwingConstants.CENTER);
		GridBagConstraints gbc_panelOriginales = new GridBagConstraints();
		gbc_panelOriginales.anchor = GridBagConstraints.NORTH;
		gbc_panelOriginales.fill = GridBagConstraints.HORIZONTAL;
		gbc_panelOriginales.insets = new Insets(0, 0, 5, 0);
		gbc_panelOriginales.gridheight = 3;
		gbc_panelOriginales.gridx = 1;
		gbc_panelOriginales.gridy = 0;
		frmTestLayoutTp.getContentPane().add(panelOriginales, gbc_panelOriginales);
		
		JButton btnGuardarImg = new JButton("Guardar Imagen");
		GridBagConstraints gbc_btnGuardarImg = new GridBagConstraints();
		gbc_btnGuardarImg.fill = GridBagConstraints.HORIZONTAL;
		gbc_btnGuardarImg.insets = new Insets(0, 0, 5, 5);
		gbc_btnGuardarImg.gridx = 0;
		gbc_btnGuardarImg.gridy = 1;
		frmTestLayoutTp.getContentPane().add(btnGuardarImg, gbc_btnGuardarImg);
		
		JProgressBar progressBar = new JProgressBar();
		GridBagConstraints gbc_progressBar = new GridBagConstraints();
		gbc_progressBar.anchor = GridBagConstraints.SOUTH;
		gbc_progressBar.fill = GridBagConstraints.HORIZONTAL;
		gbc_progressBar.insets = new Insets(0, 0, 5, 5);
		gbc_progressBar.gridx = 0;
		gbc_progressBar.gridy = 3;
		frmTestLayoutTp.getContentPane().add(progressBar, gbc_progressBar);
		
		JPanel panelFiltros = new JPanel();
		GridBagConstraints gbc_panelFiltros = new GridBagConstraints();
		gbc_panelFiltros.fill = GridBagConstraints.BOTH;
		gbc_panelFiltros.insets = new Insets(0, 0, 5, 0);
		gbc_panelFiltros.gridx = 1;
		gbc_panelFiltros.gridy = 3;
		frmTestLayoutTp.getContentPane().add(panelFiltros, gbc_panelFiltros);
		GridBagLayout gbl_panelFiltros = new GridBagLayout();
		gbl_panelFiltros.columnWidths = new int[]{329, 71, 0};
		gbl_panelFiltros.rowHeights = new int[]{14, 0, 0};
		gbl_panelFiltros.columnWeights = new double[]{1.0, 0.0, Double.MIN_VALUE};
		gbl_panelFiltros.rowWeights = new double[]{0.0, 1.0, Double.MIN_VALUE};
		panelFiltros.setLayout(gbl_panelFiltros);
		
		JLabel lblFiltroAplicado = new JLabel("Filtro Aplicado:");
		GridBagConstraints gbc_lblFiltroAplicado = new GridBagConstraints();
		gbc_lblFiltroAplicado.gridwidth = 2;
		gbc_lblFiltroAplicado.insets = new Insets(0, 0, 5, 0);
		gbc_lblFiltroAplicado.anchor = GridBagConstraints.NORTH;
		gbc_lblFiltroAplicado.gridx = 0;
		gbc_lblFiltroAplicado.gridy = 0;
		panelFiltros.add(lblFiltroAplicado, gbc_lblFiltroAplicado);
		
		JLabel placeImgFiltroAplicado = new JLabel("");
		placeImgFiltroAplicado.setIcon(new ImageIcon("C:\\Users\\Adm\\3D Objects\\NICOLAS\\TpMateC\\Imagenes de Prueba\\test3.png"));
		GridBagConstraints gbc_placeImgFiltroAplicado = new GridBagConstraints();
		gbc_placeImgFiltroAplicado.gridwidth = 2;
		gbc_placeImgFiltroAplicado.gridx = 0;
		gbc_placeImgFiltroAplicado.gridy = 1;
		panelFiltros.add(placeImgFiltroAplicado, gbc_placeImgFiltroAplicado);
		
		JLabel lblEstadoActual = new JLabel("Aplicación Iniciada con Exito.");
		GridBagConstraints gbc_lblEstadoActual = new GridBagConstraints();
		gbc_lblEstadoActual.anchor = GridBagConstraints.NORTH;
		gbc_lblEstadoActual.fill = GridBagConstraints.HORIZONTAL;
		gbc_lblEstadoActual.gridwidth = 2;
		gbc_lblEstadoActual.gridx = 0;
		gbc_lblEstadoActual.gridy = 4;
		frmTestLayoutTp.getContentPane().add(lblEstadoActual, gbc_lblEstadoActual);
	}
	private static void addPopup(Component component, final JPopupMenu popup) {
		component.addMouseListener(new MouseAdapter() {
			public void mousePressed(MouseEvent e) {
				if (e.isPopupTrigger()) {
					showMenu(e);
				}
			}
			public void mouseReleased(MouseEvent e) {
				if (e.isPopupTrigger()) {
					showMenu(e);
				}
			}
			private void showMenu(MouseEvent e) {
				popup.show(e.getComponent(), e.getX(), e.getY());
			}
		});
	}
}
