package Tp1.eje1;
public class Main {
	
	// Metodo con la estructura for
	public static void ImprimirFor (int a,int b) {
		for (int i= a; i < b; i++) {
			System.out.println(i);
		}
	}
	
	// Metodo con la estructura While
	public static void ImprimirWhile (int a,int b) {
		int i= a;
		while (i < b) {
			System.out.println (i);
			i++;
		}
	}
	
	//Metodo sin estructura interativa
	public static void ImprimirSinEstructura (int a,int b) {
		if (a > b) {
			return;
		}
		System.out.println(a);
		ImprimirSinEstructura(a + 1,b);
	}
	
	public static void main (String[] args) {
		int a= 3; int b= 8;
		
		System.out.println("Usando for");
		ImprimirFor(a,b);
		
		System.out.println("Usando while");
		ImprimirWhile(a,b);
		
		System.out.println("Sin Estructuras");
		ImprimirSinEstructura(a,b);
	}
}