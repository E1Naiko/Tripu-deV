package testSaveFilePopUpMenu;
import javax.swing.*;
import java.io.*;

public class SaveFileMenu {
    public static void main(String[] args) {
        String filePath = getDireccionAGuardar();
        System.out.println("File path: " + filePath);
    }

    public static String getDireccionAGuardar() {
        JFrame frame = new JFrame();
        JFileChooser fileChooser = new JFileChooser();
        fileChooser.setDialogTitle("Especifique una direccion para guardar TODAS las imagenes");

        // Set the default file name
        fileChooser.setSelectedFile(new File("Imagen"));

        int eleccion = fileChooser.showSaveDialog(frame);

        if (eleccion == JFileChooser.APPROVE_OPTION) {
            File archivoAGuardar = fileChooser.getSelectedFile();
            return archivoAGuardar.getAbsolutePath();
        }
        return null;
    }
}
