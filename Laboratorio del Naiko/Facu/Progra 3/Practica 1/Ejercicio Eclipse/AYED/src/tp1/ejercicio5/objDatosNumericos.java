package tp1.ejercicio5;

public class objDatosNumericos {
	private int minimo = Integer.MAX_VALUE;
	private int maximo = Integer.MIN_VALUE;
	private double promedio;
	
	public objDatosNumericos(int minimo, int maximo, int promedio) {
		this.minimo = minimo;
		this.maximo = maximo;
		this.promedio = promedio;
	}
	
	public objDatosNumericos(int minimo, int maximo) {
		this.minimo = minimo;
		this.maximo = maximo;
	}
	
	public objDatosNumericos() {
	}
	
	public void actualizarDatos(int a) {
		if (a<minimo)
			minimo = a;
		if (a>maximo)
			maximo = a;
	}
	
	public void calcPromedio(int sumatoria, int total) {
		promedio = (double) sumatoria / total;
	}

	public int getMinimo() {
		return minimo;
	}

	public void setMinimo(int minimo) {
		this.minimo = minimo;
	}

	public int getMaximo() {
		return maximo;
	}

	public void setMaximo(int maximo) {
		this.maximo = maximo;
	}

	public double getPromedio() {
		return promedio;
	}

	public void setPromedio(int promedio) {
		this.promedio = promedio;
	}

	@Override
	public String toString() {
		return "objDatosNumericos [minimo=" + minimo + ", maximo=" + maximo + ", promedio=" + promedio + "]";
	}
	
	
}
