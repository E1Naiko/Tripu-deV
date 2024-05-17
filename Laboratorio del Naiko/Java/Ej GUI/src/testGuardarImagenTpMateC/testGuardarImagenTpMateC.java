package testGuardarImagenTpMateC;

import java.awt.BorderLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Image;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.WindowConstants;

public class testGuardarImagenTpMateC {
	private static String dirImagenOriginal;
	private static JFrame frmVentanaGUI;
	private static String nombreArchivo;
	private static BufferedImage original;
	private static BufferedImage fotoByN;
	private static BufferedImage fotoGrises;
	private static BufferedImage filtro1;
	private static BufferedImage filtro2;

	public static void main(String[] args) {
		dirImagenOriginal = "D:\\Escritorio\\test\\IMG-20190111-WA0016.jpg";
		original = cargarFoto(dirImagenOriginal);
		fotoGrises = original;
		filtro1 = original;
		filtro2 = original;
		fotoByN = original;

		// ------------ VENTANA PRINCIPAL ------------
		frmVentanaGUI = new JFrame();
		frmVentanaGUI.setTitle("TEST LAYOUT TP MATE C");
		frmVentanaGUI.setBounds(100, 100, 1000, 720);
		frmVentanaGUI.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		GridBagLayout gridBagLayout = new GridBagLayout();
		gridBagLayout.columnWidths = new int[] { 150, 0, 0, 700, 0 };
		gridBagLayout.rowHeights = new int[] { 23, 0, 251, 275, 0, 0, 14, 0 };
		frmVentanaGUI.getContentPane().setLayout(gridBagLayout);

		// ------------ BOTON GUARDAR IMAGEN ------------
		JButton btnGuardarImg = new JButton("Guardar Imagen");
		GridBagConstraints gbc_btnGuardarImg = new GridBagConstraints();
		gbc_btnGuardarImg.fill = GridBagConstraints.HORIZONTAL;
		gbc_btnGuardarImg.insets = new Insets(0, 0, 5, 5);
		gbc_btnGuardarImg.gridx = 0;
		gbc_btnGuardarImg.gridy = 1;

		// ------------ ACCION GUARDAR IMAGEN ------------
		frmVentanaGUI.getContentPane().add(btnGuardarImg, gbc_btnGuardarImg);
		btnGuardarImg.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String dirGuardado = getDireccionAGuardar();
				if (dirGuardado != null) {
					System.out.println("Direccion a guardar: " + dirGuardado);
					guardarImagenesEnDir(dirGuardado);
				}
			}
		});
		
		frmVentanaGUI.setVisible(true);
	}

	public static String getDireccionAGuardar() {
		// Crear un objeto JFileChooser
		JFileChooser fileChooser = new JFileChooser();

		// Establecer el directorio actual como directorio por defecto
		fileChooser.setCurrentDirectory(new File(System.getProperty("user.home")));

		// Configurar el fileChooser para seleccionar directorios solamente
		fileChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);

		// Mostrar la ventana de diálogo para seleccionar un directorio
		int userSelection = fileChooser.showOpenDialog(null);

		if (userSelection == JFileChooser.APPROVE_OPTION) {
			// Obtener la dirección del directorio seleccionado por el usuario
			File selectedDirectory = fileChooser.getSelectedFile();
			String directoryPath = selectedDirectory.getAbsolutePath();

			// Aquí puedes usar 'directoryPath' para guardar archivos en esa ubicación
			System.out.println("Directorio seleccionado: " + directoryPath);
			return directoryPath;
		} else {
			System.out.println("ERROR - getDireccionAGuardar: Direccion no encontrada");
			return null;
		}
	}

	public static void guardarImagen(BufferedImage imagen, String directorio, String nombreArchivo) {
		try {
			System.out.println("guardarImagen - direccion:" + directorio + " nombre: " + nombreArchivo);
			File archivoSalida = new File(directorio, nombreArchivo + ".png");
			System.out.println(" direccion salida: " + directorio + " archivo salida: " + archivoSalida.getPath());
			ImageIO.write(imagen, "png", archivoSalida);
		} catch (IOException e) {
			System.out.println("Error - Guardar Imagen: " + e.getMessage());
		}
	}

	public static void guardarImagenesEnDir(String direccionNueva) {
		String aux;
		aux = nombreArchivo + " - Original";
		guardarImagen(original, direccionNueva, aux);
		aux = nombreArchivo + " - Escala de Grises";
		guardarImagen(fotoGrises, direccionNueva, aux);
		aux = nombreArchivo + " - Filtro 1";
		guardarImagen(filtro1, direccionNueva, aux);
		aux = nombreArchivo + " - Filtro 2";
		guardarImagen(filtro2, direccionNueva, aux);
		aux = nombreArchivo + " - Blanco y Negro";
		guardarImagen(fotoByN, direccionNueva, aux);
	}
	
	public static BufferedImage cargarFoto(String direccionArchivo) {
		// variables de manejo de archivo
		File archivo;
		BufferedImage foto;

		archivo = new File(direccionArchivo);
		foto = null;

		// el bloque try-catch lo usamos para ver si el archivo se cargo correctamente
		try {
			foto = ImageIO.read(archivo);
		} catch (IOException e) {
			System.out.println("ERROR - Imagen no cargada: " + e.getMessage());
		}

		nombreArchivo = archivo.getName();
		return foto;
	}
	
	public static void display(BufferedImage foto) {
		System.out.println("Displaying image");
		JFrame frame = new JFrame();
		JLabel label = new JLabel();

		// Get screen size
		java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
		double screenWidth = screenSize.getWidth();
		double screenHeight = screenSize.getHeight();

		// Get image size
		double imageWidth = foto.getWidth();
		double imageHeight = foto.getHeight();

		// Calculate the scale factor
		double scaleFactor = Math.min(screenWidth / imageWidth, screenHeight / imageHeight);

		// Calculate the new width and height while maintaining the aspect ratio
		int newWidth = (int) (imageWidth * scaleFactor);
		int newHeight = (int) (imageHeight * scaleFactor);

		// Resize the image
		Image scaledImage = foto.getScaledInstance(newWidth, newHeight, Image.SCALE_DEFAULT);
		ImageIcon icon = new ImageIcon(scaledImage);

		label.setIcon(icon);
		frame.getContentPane().add(label, BorderLayout.CENTER);
		frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
		frame.pack();
		frame.setVisible(true);
	}
}