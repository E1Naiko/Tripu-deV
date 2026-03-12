package tp1.ejercicio2;
import java.util.Scanner;

public class tp1ej2clase {
	static int [] newArray(int n) {
		int[] ret = new int[n];
		
		for (int i=0; i<n; i++) {
			ret[i] = (i+1)*5;
		}
		
		return ret;
	}
	
	static void printArray(int[] arr) {
		System.out.print("[");
		for (int i=0; i<arr.length; i++) {
			System.out.print(arr[i] + ", ");
		}
		System.out.printf("]");
	}
	
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		int [] res;
		
		int size = input.nextInt();
		res = newArray(size);
		if (size>0)
			printArray(res);
		input.close();
	}
	
}
