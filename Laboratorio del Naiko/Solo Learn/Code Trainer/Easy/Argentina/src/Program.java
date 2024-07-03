/*You are in a hat store in Argentina! The prices are listed in US Dollars and Argentinian Pesos.
 * You have both, but you want to make sure you pay the lower price! Do you pay in Dollars or Pesos?
 * The exchange rate is 2 cents for every Peso.

Task 
 * Create a program that takes two prices and tells you which one is lower after conversion.

Input Format 
 * Two integer values, the first one is the price in Pesos and the second one is the price in Dollars.

Output Format 
 * A string that says which currency you should make the purchase in ('Dollars' or 'Pesos').

Sample Input 
 * 4000 -> ARS PESOS
 * 100 -> USD

Sample Output 
 * Pesos
 */

import java.util.Scanner;
public class Program{
	public static void main(String[] args) {
		// Variable Initialization
		Scanner in = new Scanner(System.in);
		String result = "error";
		
		int priceARG = in.nextInt();
		double arsToUsd = conversion(priceARG);
		int priceUSD = in.nextInt();	
		
		// data management
		if (priceUSD < arsToUsd) {
			result = "Dollars";
		} else {
			result = "Pesos";
		}
		
		System.out.println(result);
	}
	
	static double conversion(int ars) {
		// takes a number in $ARS and converts it to $USD
		double res = ars*0.02;
		return res;
		
	}
}