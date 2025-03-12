package tp1.ejercicio1;



public class tp1ej1 {
	static void pedidoFor(int a, int b) {
		for (int i=a;i<=b; i++) {
			System.out.print(i);
		}
	}
	
	static void pedidoWhile(int a,int b) {
		int i = a;
		while(i<=b) {
			System.out.print(i);
			i++;
		}
	}
	
	static void pedido(int a,int b) {
		int i=a;
		if (i<=b) {
			System.out.print(i);
			i++;
			pedido(i,b);
		}
	}
	
	public static void main(String[] args) {
		int a = 1;
		int b = 10;
		
		tp1ej1.pedidoFor(a, b);
		System.out.println();
		tp1ej1.pedidoWhile(a, b);
		System.out.println();
		tp1ej1.pedido(a, b);
		System.out.println();
	}
}
