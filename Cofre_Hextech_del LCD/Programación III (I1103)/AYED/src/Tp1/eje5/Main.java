package Tp1.eje5;
import java.util.Random;
import java.security.SecureRandom;

public class Main {
	
	// Metodo devolver por return
	public static int[] procesar (int[] v) {
		int[] resul= new int[3];
		resul[0]= -1;
		resul[1]= 999;
		resul[2]= 0;
		int total=0;
		for (int k= 0; k < 10; k++) {
			if (v[k] < resul[1]) resul[1] = v[k];
			else if (v[k] > resul[0]) resul[0] = v[k];
			 total = total + v[k];
			}
		resul[2]= total / 3;
		return resul;
	}
	
	public static void main(String[] args) {
		int[] vector = new int [10];
		Random rand= new Random(System.currentTimeMillis());
		for (int i=0; i<10; i++) {
			vector[i]= rand.nextInt(100);
		}
		int[] resultado = new int[3];
		resultado= procesar(vector);
		for (int k=0; k<10; k++) {
			System.out.println(resultado[k]);
		}
		
	}

}
