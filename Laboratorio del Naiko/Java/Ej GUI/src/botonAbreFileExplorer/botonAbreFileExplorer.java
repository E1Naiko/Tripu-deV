package botonAbreFileExplorer;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

import javax.swing.*;
import javax.swing.filechooser.FileNameExtensionFilter;

public class botonAbreFileExplorer implements ActionListener{
	private String dirArchivo;
	private JFrame frame;
	private JButton button;
	private JLabel label;
	private JPanel panel;

	public botonAbreFileExplorer() {
		frame = new JFrame();
		
		button = new JButton("Abrir Archivo");
		button.addActionListener(this);
		
		label = new JLabel("Esperando Archivo");
		
		panel = new JPanel();
		
		panel.setBorder(BorderFactory.createEmptyBorder());
		panel.setLayout(new GridLayout(0, 1));
		panel.add(button);
		panel.add(label);
		
		frame.add(panel, BorderLayout.CENTER);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setTitle("Our GUI");
		frame.pack();
		frame.setVisible(true);
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new botonAbreFileExplorer();
		
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		dirArchivo = openFileViaExplorer();
		label.setText("Archivo leido: " + dirArchivo);
	}
	
	public static String openFileViaExplorer() {
		try {
			JFileChooser fileChooser = new JFileChooser();
			FileNameExtensionFilter filter = new FileNameExtensionFilter("Formatos Admitidos: .png, .jpeg", "png", "jpeg");
			fileChooser.setFileFilter(filter);
			
			fileChooser.setCurrentDirectory(new File("."));
			
			int result = fileChooser.showOpenDialog(null);
			System.out.println("Result " + result);
			
			if(result == JFileChooser.APPROVE_OPTION) {
				File selectedFile = new File(fileChooser.getSelectedFile().getAbsolutePath());
				System.out.println(fileChooser.getSelectedFile().getAbsolutePath());
				
				if (Desktop.isDesktopSupported() &&
						(fileChooser.getSelectedFile().getAbsolutePath().endsWith(".png") ||
						fileChooser.getSelectedFile().getAbsolutePath().endsWith(".jpeg"))) {
					Desktop desktop = Desktop.getDesktop();
					desktop.open(selectedFile);
					
					return fileChooser.getSelectedFile().getAbsolutePath();
				}
				else {
					System.out.println("Not Supported");
					return "ERROR - ARCHIVO NO SOPORTADO";
				}
			}
			else if (result == JFileChooser.CANCEL_OPTION) {
				System.out.println("Cancelled");
				return "Operacion Cancelada";
			}
			
			
		}
		catch(Exception e) {
			System.out.println(e);
			return "Error: " + e;
		}
		return null;
	}

}
