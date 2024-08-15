package application;

import java.io.IOException;

public class osManagement{
	public osManagement() {
		System.out.println("OS EVENT - INNIT OSMAN");
	}
	
	public void startTimer(int totalSeconds) {
		System.out.println("OS EVENT - STATING TIMER");
		/*try {
            // Create a ProcessBuilder to run the shutdown command
            ProcessBuilder processBuilder = new ProcessBuilder("shutdown", "/s", "/t", String.format("%d", totalSeconds));
            Process process = processBuilder.start();
            
            // Wait for the process to finish
            process.waitFor();
            
            System.out.println("Shutdown command executed.");
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }*/
	}
	
	public void cancelTimer() {
		System.out.println("OS EVENT - CANCELLING TIMER");
		/*try {
            // Execute the shutdown cancel command
            ProcessBuilder processBuilder = new ProcessBuilder("shutdown", "/a");
            Process process = processBuilder.start();
            
            // Wait for the process to finish
            process.waitFor();
            
            System.out.println("Shutdown canceled.");
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }*/
	}
}
