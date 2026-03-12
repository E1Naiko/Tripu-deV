package tp1.ejercicio5;

public class comparacionArregloInt {
	private static objDatosNumericos varC;
	
	private static objDatosNumericos incisoA(int [] v) {
		objDatosNumericos dataso = new objDatosNumericos();
		int sumatoria = 0;
		int n = v.length;
		for (int i = 0; i<n; i++) {
			sumatoria += v[i];
			dataso.actualizarDatos(v[i]);
		}
		dataso.calcPromedio(sumatoria, n);
		return dataso;
	}
	
	private static void incisoB(int [] v, objDatosNumericos dataso) {
		int sumatoria = 0;
		int n = v.length;
		for (int i = 0; i<n; i++) {
			sumatoria += v[i];
			dataso.actualizarDatos(v[i]);
		}
		dataso.calcPromedio(sumatoria, n);
	}
	
	private static void incisoC(int [] v) {
		int sumatoria = 0;
		int n = v.length;
		for (int i = 0; i<n; i++) {
			sumatoria += v[i];
			varC.actualizarDatos(v[i]);
		}
		varC.calcPromedio(sumatoria, n);
	}
	
	public static void main(String[] args) {
		int [] v = {1,2,3,4,5,6,7,8,9,10};
		objDatosNumericos varA, varB;
		
		varA = new objDatosNumericos();
		varA = incisoA(v);
		System.out.println("A: " + varA.toString());
		
		varB = new objDatosNumericos();
		incisoB(v, varB);
		System.out.println("B: " + varB.toString());
		
		varC = new objDatosNumericos();
		incisoC(v);
		System.out.println("C: " + varC.toString());
	}
}
