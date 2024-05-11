package fileExplorer;

import java.awt.Desktop;
import java.io.File;

import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;

public class openFileViaExplorer {
	public static void main(String[] args) {
		System.out.println(openFileViaExplorer());

	}
	
	public static boolean openFileViaExplorer() {
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
					
					return true;
				}
				else {
					System.out.println("Not Supported");
					return false;
				}
			}
			else if (result == JFileChooser.CANCEL_OPTION) {
				System.out.println("Cancelled");
				return false;
			}
			
			
		}
		catch(Exception e) {
			System.out.println(e);
			return false;
		}
		return false;
	}

}
