/*
 **Roadrunner Challenge**

A coyote is chasing a roadrunner, and they start out 50 feet apart. If you know how fast they are
both traveling and how far the roadrunner is from safety, determine whether or not the coyote is able
to catch the roadrunner. Both animals and the roadrunner's safe place are on a straight line.

 **Task:**
Determine whether or not the roadrunner made it to safety.

 **Input Format:**
Three integer values:
1. The distance the roadrunner is from safety.
2. The roadrunner's speed (feet/second).
3. The coyote's speed (feet/second).

 **Output Format:**
A string that says 'Meep Meep' if the roadrunner made it, or 'Yum' if the coyote caught up to the roadrunner.

 **Sample Input:**
	10
	5
	20

 **Sample Output:**
	Meep Meep

 */
package roadrunnerMain;
import java.util.Scanner;

public class roadrunnerMain{
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		double startingDistance = 50;
		double safetyDistance = in.nextDouble();
		double roadrunnerVelocity = in.nextDouble();
		double coyoteVelocity = in.nextDouble();
		
		double roadrunnerTime;
		double coyoteFinalPosition;
		
		roadrunnerTime = getTime(safetyDistance+startingDistance, roadrunnerVelocity, startingDistance);
		coyoteFinalPosition = getFinalPosition(0, coyoteVelocity, 0, roadrunnerTime);
		
		//System.out.println("roadrunnerTime " + roadrunnerTime + ", coyoteFinalPosition: " + coyoteFinalPosition + ".");
		
		if (coyoteFinalPosition >= safetyDistance+startingDistance) {
			System.out.println("Yum");
		}
		else {
			System.out.println("Meep Meep");
		}
		
		in.close();
	}
	
	public static double getTime(double finalPosition, double velocity, double initialPosition) {
		double time = (finalPosition - initialPosition)/velocity;
		return time;
	}
	
	public static double getFinalPosition(double initialPosition, double velocity, double acceleration, double time) {
		double finalPosition = initialPosition + (velocity*time) + (acceleration * Math.pow(time, 2) /2);
		return finalPosition;
	}
}