package application;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.stage.Stage;

public class ConfirmationPopUpController {
    @FXML
    private Button btnCancelTime;
    @FXML
    private Button btnConfirmedTime;
    @FXML 
    private Label lblFinalTime;

    private Main mainApp;



    public void confirm(ActionEvent event) {
        System.out.println("CONFIRMATION EVENT - ACTION: CONFIRMED\n");
        if (mainApp != null) {
            mainApp.startTimer();
        }
        exitApplication(event);
    }

    public void cancel(ActionEvent event) {
        System.out.println("CONFIRMATION EVENT - ACTION: CANCELLED\n");
        if (mainApp != null) {
            mainApp.cancelInnit();
        }
        exitApplication(event);
    }

    public void exitApplication(ActionEvent event) {
        System.out.println("CONFIRMATION EVENT - CLOSING POP UP\n");
        // Close the stage
        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        stage.close();
    }
    
    
    // Setters and Getters
    public void setMainApp(Main mainApp) {
        this.mainApp = mainApp;
    }

    public void setFinalTimeText(String text) {
        lblFinalTime.setText(text);
    }
}
