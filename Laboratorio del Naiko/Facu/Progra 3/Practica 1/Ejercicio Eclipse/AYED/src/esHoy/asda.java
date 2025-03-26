package esHoy;

public class asda {
	public static void esHoy(int i) {
		System.out.println("Es Hoy n°" + i);
		if (i>0) {
			esHoy(i-1);
		}
	}
	public static void main(String[] args) {
		esHoy(2000);
	}
}
