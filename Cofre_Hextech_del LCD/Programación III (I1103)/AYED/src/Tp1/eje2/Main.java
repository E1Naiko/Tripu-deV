package Tp1.eje2;
import java.util.Scanner;

public class Main {
	
	public static int [] devolverVector (int a) {
		int [] vector = new int [a];
		for (int i = 0; i < a; i++) {
			vector[i] = a * (i + 1);
		}
		return vector;
	}
	
	public static void ImprimirVector (int []vector, int a) {
		for (int i=0; i < a; i++) {
			System.out.println("Numero" +vector[i]);
			System.out.println(" es multiplo de " +i);
		}
	}
	
	public static void main (String[] args) {
		int a;
		Scanner scanner = new Scanner(System.in);
		System.out.println("Escribir numero");
		a = scanner.nextInt();
		int[] vectorMultiplos = devolverVector(a);
		ImprimirVector(vectorMultiplos,a);
		scanner.close();
	}
}
