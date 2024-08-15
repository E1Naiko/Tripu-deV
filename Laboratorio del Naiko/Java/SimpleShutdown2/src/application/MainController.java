package application;

import java.time.LocalTime;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Label;
import javafx.scene.control.ProgressBar;
import javafx.scene.control.ProgressIndicator;
import javafx.scene.control.TextField;

public class MainController {
	
    @FXML
    private Label lblTimer;
    @FXML
    private Label lblStatus;
    @FXML
    private Label lblLatestAction;
    @FXML
    private TextField txtHours;
    @FXML
    private TextField txtMinutes;
    @FXML
    private TextField txtSeconds;
    @FXML
    private Button btnStart;
    @FXML
    private Button btnStop;
    @FXML
    private ProgressBar progBar;
    @FXML
    private ProgressIndicator progIndicator;
    @FXML
    private ChoiceBox<String> chBoxModeSelector;
    ObservableList<String> modeList = FXCollections.observableArrayList("Mode: Countdown", "Mode: On Specific Time");
    
    private int hours = 0, minutes = 0, seconds = 0;

    private Main mainApp;

    @FXML
    private void initialize() {
        chBoxModeSelector.setItems(modeList);
        if (!modeList.isEmpty()) {
            chBoxModeSelector.setValue(modeList.get(0));
        }

        chBoxModeSelector.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                // Handle the change in selected item
                System.out.println("Selected mode changed from " + oldValue + " to " + newValue);
                Main.setTimeMode(newValue);
            }
        });
    }
    
    

    @FXML
    private void start(ActionEvent event) {
    	System.out.println("EVENT - ACTION: START");
        if (mainApp != null) {
        	String mode = Main.getTimeMode();
        	if (mode.equals("Mode: Countdown")) {
        		countdownModeInnit();
        	}
        	else {
        		specificTimeInnit();
        	}
        	
        	int totalSeconds = (hours * 3600) + (minutes * 60) + seconds;
        	System.out.println("TIME = " + hours + ":" + minutes + ":" +  seconds + " TOTAL" + totalSeconds);
            mainApp.setTime(hours, minutes, seconds);
            mainApp.setTotalSeconds(totalSeconds);
            setLblLatestAction("Calculating Time");
            System.out.println("EVENT - TIME SET: " + hours + ":" + minutes + ":" + seconds + " - TOTAL SECONDS: " + totalSeconds);
            mainApp.showConfirmationPopUp();
        } else {
            System.err.println("Main application reference is null.");
        }
    }

    
    
    @FXML
    private void stop(ActionEvent event) {
    	setLblLatestAction("Emergency Stop Triggered");
        System.out.println("EVENT - ACTION: EMERGENCY STOP");
        if (mainApp != null) {
            mainApp.emergencyStop();
        } else {
            System.err.println("Main application reference is null.");
        }
    }
    
    
    
    private void countdownModeInnit() {
    	hours = 0; minutes = 0; seconds = 0;
        System.out.println("MODE SELECTED - COUNTDOWN");
        try {
            hours = Integer.parseInt(txtHours.getText());
            if (hours < 0) hours = 0;
        } catch (NumberFormatException e) {
            hours = 0;
        }
        try {
            minutes = Integer.parseInt(txtMinutes.getText());
            if (minutes < 0) minutes = 0;
        } catch (NumberFormatException e) {
            minutes = 0;
        }
        try {
            seconds = Integer.parseInt(txtSeconds.getText());
            if (seconds < 0) seconds = 0;
        } catch (NumberFormatException e) {
            seconds = 0;
        }

        while (seconds >= 60) {
            minutes++;
            seconds -= 60;
        }

        while (minutes >= 60) {
            hours++;
            minutes -= 60;
        }
    }
    
    
    
    private void specificTimeInnit() {
        hours = 0;
        minutes = 0;
        seconds = 0;
        System.out.println("MODE SELECTED - SPECIFIC TIME");

        LocalTime currentTime = LocalTime.now();
        int actHour = currentTime.getHour();
        int actMinute = currentTime.getMinute();
        int actSecond = currentTime.getSecond();

        int targetHour = 0;
        int targetMinute = 0;
        int targetSecond = 0;

        try {
            targetHour = Integer.parseInt(txtHours.getText());
        } catch (NumberFormatException e) {
            targetHour = 0;
        }

        try {
            targetMinute = Integer.parseInt(txtMinutes.getText());
        } catch (NumberFormatException e) {
            targetMinute = 0;
        }

        try {
            targetSecond = Integer.parseInt(txtSeconds.getText());
        } catch (NumberFormatException e) {
            targetSecond = 0;
        }

        // Calculate the remaining time
        int totalCurrentSeconds = actHour * 3600 + actMinute * 60 + actSecond;
        int totalTargetSeconds = targetHour * 3600 + targetMinute * 60 + targetSecond;

        int remainingSeconds = totalTargetSeconds - totalCurrentSeconds;

        // If the target time is earlier in the day, calculate time until the next day
        if (remainingSeconds < 0) {
            remainingSeconds += 24 * 3600;
        }

        hours = remainingSeconds / 3600;
        remainingSeconds %= 3600;
        minutes = remainingSeconds / 60;
        seconds = remainingSeconds % 60;

        System.out.println("Time left: " + hours + " hours, " + minutes + " minutes, " + seconds + " seconds");
    }



    // Setters and Getters
    public void setMainApp(Main mainApp) {
        this.mainApp = mainApp;
    }
    
    
    
    public void setLblTimerText(String text) {
        if (lblTimer != null) {
            lblTimer.setText(text);
        } else {
            System.err.println("lblTimer is null in MainController.");
        }
    }
    
    public void setLblStatusText(String text) {
    	if (lblStatus != null) {
    		lblStatus.setText(text);
        } else {
            System.err.println("lblStatus is null in MainController.");
        }
    }
    
    public void setLblLatestAction(String text) {
    	if (lblLatestAction != null) {
    		lblLatestAction.setText(text);
        } else {
            System.err.println("lblStatus is null in MainController.");
        }
    }
    
    public void setProgressIndicatorLevel(double porcentage) {
    	progIndicator.setProgress(porcentage);
    }
    
    public void setProgressBarLevel(double porcentage) {
    	progBar.setProgress(porcentage);
    }

    @FXML
    private void setHour(ActionEvent event) {
        System.out.println("EVENT - TIME UPDATE: HOURS");
    }

    @FXML
    private void setMinutes(ActionEvent event) {
        System.out.println("EVENT - TIME UPDATE: MINUTES");
    }

    @FXML
    private void setSeconds(ActionEvent event) {
        System.out.println("EVENT - TIME UPDATE: SECONDS");
    }
    
}
