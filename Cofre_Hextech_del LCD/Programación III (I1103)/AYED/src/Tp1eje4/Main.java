package Tp1eje4;

public class Main {
	public static void swap1 (int x, int y) {
		if (x < y) { //Se verifica si x es menor que y
			int tmp = x ; //En la variable auxiliar se guarda x
			x = y ; //Se iguala 
			y = tmp;
		}
	}
	public static void swap2 (Integer x, Integer y) {
		if (x < y) {
			int tmp = x ;
			x = y ;
			y = tmp;
		}
	}
	public static void main(String[] args) {
		int a = 1, b = 2;
		Integer c = 3, d = 4;
		swap1(a,b);
		swap2(c,d);
		System.out.println("a=" + a + " b=" + b) ;
		System.out.println("c=" + c + " d=" + d) ;
		}
}
