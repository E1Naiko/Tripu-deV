package tp1.ejercicio5;

import java.util.random.RandomGenerator;

public class comparacionArregloInt {
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
	
	private static void incisoC() {
		
	}
	
	public static void main(String[] args) {
		
	}
}
