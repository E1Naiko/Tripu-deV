package ConvergenciaDeSeries;

public class Convergencia {
	private static int HASTA = 5;
	public static String imprimirValor(int aux) {
		String res = "0";
		if (aux>0) {
			res = imprimirValor(aux-1) + " + 1/" + aux;
		}
		return res;
	}
	public static void main(String[] args) {
		double suma = 0;
		double resto = 0;
		suma = calcularSuma(HASTA);
		
		resto = 1-suma;
		
		System.out.println("Serie: " + imprimirValor(HASTA) + " = " + suma);
		System.out.println("Resto: " + resto);
		System.out.println(suma + " + " + resto + " = " + (suma+resto));
	}
	
	private static double calcularSuma(int i) {
		double res = 0;
		if (i>1) {
			res += (double) 1/i + calcularSuma(i-1);
		}
		return res;
	}
}
