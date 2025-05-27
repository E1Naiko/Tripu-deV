package tp5.ejercicio3;

import java.util.ArrayList;
import java.util.List;

import tp5.ejercicio1.Graph;
import tp5.ejercicio1.Vertex;

public class Mapa implements MapaInterface{
	private Graph<String> grafo;

	private void caminoMasCorto(String ciudad1, String ciudad2, List<String> lista) {
		
	}

	@Override
	public List<String> devolverCamino(String ciudad1, String ciudad2) {
		List<String> lista = new ArrayList<String>();
		Vertex<String> vertice1 = grafo.search(ciudad1),
				vertice2 = grafo.search(ciudad2);
		if ((vertice1 != null) && (vertice2 != null)) {
			
		}
		
		return lista;
	}

	@Override
	public List<String> devolverCaminoExceptuando(String ciudad1, String ciudad2, List<String> ciudades) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> caminoMasCorto(String ciudad1, String ciudad2) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> caminoSinCargarCombustible(String ciudad1, String ciudad2, int tanqueAuto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> caminoConMenorCargaDeCombustible(String ciudad1, String ciudad2, int tanqueAuto) {
		// TODO Auto-generated method stub
		return null;
	}

}
