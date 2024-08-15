package application;

import java.io.IOException;

import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.util.Duration;

public class Main extends Application {

	private static String timeMode;
	private static String finalTime = "00:00:00";
	private static String confirmationTime = "00:00:00";
	private static int hours = 0;
	private static int minutes = 0;
	private static int seconds = 0;
	private static int totalSeconds;
	private static int timeLeft = 0;

	private Stage popUpStage;
	private static osManagement osMan;
	private MainController mainContr;
	private Timeline timeline;



	public static void main(String[] args) {
		totalSeconds = 0;
		timeMode = "Mode: Countdown";
		osMan = new osManagement();
		launch(args);
	}



	// Timer management
	@Override
	public void start(Stage primaryStage) {
		try {
			FXMLLoader loader = new FXMLLoader(getClass().getResource("MainController.fxml"));
			Parent root = loader.load();

			// Initialize controller
			mainContr = loader.getController();
			if (mainContr == null) {
				throw new RuntimeException("MainContr is null after loading FXML.");
			}

			mainContr.setMainApp(this);
			mainContr.setLblStatusText("");

			Scene mainScene = new Scene(root);
			mainScene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());

			primaryStage.setScene(mainScene);
			primaryStage.setTitle("SimpleShutdown 2.0");
			primaryStage.setResizable(false);
			primaryStage.show();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public void emergencyStop() {
        if (mainContr == null) {
            System.out.println("MAIN - emergencyStop() method - MainContr is not initialized.");
            return;
        }

        System.out.println("EVENT - MAIN: CANCELING TIMER");

        if (timeline != null && timeline.getStatus() == Timeline.Status.RUNNING) {
            timeline.stop();
        }

        String finalTime = "00:00:00";
        mainContr.setLblTimerText(finalTime);
        mainContr.setLblStatusText("EMERGENCY TRIGGERED");
        osMan.cancelTimer();
    }



	public void showConfirmationPopUp() {
		try {
			FXMLLoader loader = new FXMLLoader(getClass().getResource("ConfirmationPopUp.fxml"));
			Parent popUpContent = loader.load();

			ConfirmationPopUpController controller = loader.getController();
			confirmationTime = String.format("%02d:%02d:%02d", hours, minutes, seconds);
			controller.setFinalTimeText(confirmationTime);
			controller.setMainApp(this); // Pass the main application reference

			popUpStage = new Stage();
			popUpStage.setScene(new Scene(popUpContent));
			popUpStage.setTitle("SimpleShutdown 2.0");
			popUpStage.setResizable(false);

			popUpStage.show();

			popUpStage.setOnCloseRequest(event -> {
				System.out.println("CONFIRMATION EVENT - ACTION: WINDOW EXITED ");
				cancelInnit();
			});

		} catch (IOException e) {
			System.err.println(e);
		}
	}



	// GUI management
	private void updateLabel(int time) {
	    int hours = time / 3600;
	    int minutes = (time % 3600) / 60;
	    int seconds = time % 60;
	    String timeString = String.format("%02d:%02d:%02d", hours, minutes, seconds);
	    mainContr.setLblTimerText(timeString);
	}



	private void updateProgressBar(int time) {
	    double progress = 1 - (double) time / totalSeconds;
	    if (progress >= 0.9)
	    	mainContr.setLblStatusText("SHUTDOWN IMMINET");
	    mainContr.setProgressBarLevel(progress);
	    mainContr.setProgressIndicatorLevel(progress);
	}



	public void cancelInnit() {
		System.out.println("EVENT - MAIN: CANCELING TIMER INNITIALIZATION");
	}

	
	
	public void startTimer() {
	    if (mainContr == null) {
	        System.err.println("MAIN - startTimer() method - MainContr is not initialized.");
	        return;
	    }

	    mainContr.setLblLatestAction("Initializing Timer");
	    System.out.println("EVENT - MAIN: STARTING TIMER");

	    finalTime = String.format("%02d:%02d:%02d", hours, minutes, seconds);
	    mainContr.setLblTimerText(finalTime);
	    mainContr.setLblStatusText("Timer Active");
	    mainContr.setProgressBarLevel(0);
	    mainContr.setProgressIndicatorLevel(0);
	    osMan.startTimer(totalSeconds);

	    timeLeft = totalSeconds;

	    timeline = new Timeline();
	    timeline.getKeyFrames().add(new KeyFrame(Duration.seconds(1), event -> {
	        if (timeLeft > 0) {
	            timeLeft--;
	            updateLabel(timeLeft);
	            updateProgressBar(timeLeft);
	        } else {
	            timeline.stop();
	            mainContr.setLblStatusText("Timer Finished");
	            Platform.exit();
	        }
	    }));
	    timeline.setCycleCount(Timeline.INDEFINITE);
	    timeline.play();
	}


	// Setters and Getters
	public void setTime(int newHours, int newMinutes, int newSeconds) {
		setHours(newHours);
		setMinutes(newMinutes);
		setSeconds(newSeconds);
	}

	public void setTotalSeconds(int totalSeconds) {
		Main.totalSeconds = totalSeconds;
	}

	public void setHours(int hours) {
		Main.hours = hours;
	}
	public void setMinutes(int minutes) {
		Main.minutes = minutes;
	}
	
	public void setSeconds(int seconds) {
		Main.seconds = seconds;
	}

	public static String getTimeMode() {
		return timeMode;
	}

	public static void setTimeMode(String timeMode) {
		Main.timeMode = timeMode;
	}
}
