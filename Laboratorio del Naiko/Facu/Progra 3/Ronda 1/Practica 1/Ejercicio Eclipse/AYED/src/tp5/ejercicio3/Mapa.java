package tp5.ejercicio3;

import java.util.ArrayList;
import java.util.List;

import tp5.ejercicio1.Edge;
import tp5.ejercicio1.Graph;
import tp5.ejercicio1.Vertex;

public class Mapa implements MapaInterface{
	private Graph<String> grafo;

	private List<String> buscarPrimerCaminoRecorridoDfs(int i, Vertex<String> objetivo, Graph<String> grafo, boolean[] marca) {
		List<String> lista = new ArrayList<String>();
		marca[i] = true;
		Vertex<String> v = grafo.getVertex(i);
		
		// Si v[i]==vertice 1 Agrego a la lista y retorno
		if (grafo.getVertex(i).equals(objetivo)) {
			lista.add(v.getData());
			return lista;
		}
		
		List<Edge<String>> adyacentes = grafo.getEdges(v); //adyacentes
		for (Edge<String> e: adyacentes){
			int j = e.getTarget().getPosition();
			if (!marca[j]) {
				lista.addAll(buscarPrimerCaminoRecorridoDfs(j, objetivo, grafo, marca));
				if (!lista.isEmpty()) {
					lista.add(e.getTarget().getData());
					return lista;
				}
			}
		}
		return lista;
	}
	
	@Override
	public List<String> devolverCamino(String ciudad1, String ciudad2) {
		/*
		 * 1) Busco si existen los vertices que contienen ciudad 1 y 2
		 * 2) (recorrido?) Busco el vertice que contiene la ciudad 1
		 * 3) (DFS) partiendo del vertice 1, recorro todos los caminos
		 * 	hasta encontrar el primero que llegue al vertice 2 
		 */
		List<String> lista = new ArrayList<String>();
		Vertex<String> vertice1 = grafo.search(ciudad1),
			vertice2 = grafo.search(ciudad2);
		
		if ((vertice1 != null) && (vertice2 != null)) {
			boolean[] marca = new boolean[grafo.getSize()];
			lista.addAll(buscarPrimerCaminoRecorridoDfs(vertice1.getPosition(), vertice2, grafo, marca));
		}
		
		return lista;
	}
	
	
	// Solucion de luchito
	private boolean DFSLuchito(Vertex<String> actual, Vertex<String> destino, boolean [] marca, List<String> camino) {
		marca[actual.getPosition()] = true;
		camino.add(actual.getData());
		if (actual.equals(destino)) {
			return true;
		}
		List<Edge<String>> adyacentes = new ArrayList<Edge<String>>();
		for (Edge<String> e: adyacentes) {
			Vertex<String> siguiente = e.getTarget();
			if (!marca[siguiente.getPosition()]) {
				if (DFSLuchito(siguiente, destino, marca, camino)) {
					return true;
				}
			}
		}
		camino.remove(camino.size()-1);
		return false;
	}
	
	public List<String> devolverCaminoLuchito(String a, String b){
		List<String> camino = new ArrayList<String>();
		Vertex<String> puntoA = grafo.search(a),
				puntoB = grafo.search(b);
		if (puntoA != null && puntoB != null) {
			boolean [] marca = new boolean[grafo.getSize()];
			if (DFSLuchito(puntoA, puntoB, marca, camino)) {
				return camino;
			}
		}
		
		return new ArrayList<String>();
	}

	private boolean buscarCaminoExceptuandoRecorridoDFS(int i, Vertex<String> objetivo, Graph<String> grafo, boolean[] marca) {
		
		return false;
	}
	
	@Override
	public List<String> devolverCaminoExceptuando(String ciudad1, String ciudad2, List<String> ciudades) {
		List<String> lista = new ArrayList<String>();
		Vertex<String> vertice1 = grafo.search(ciudad1),
				vertice2 = grafo.search(ciudad2);
		if (vertice1 != null && vertice2 != null) {
			boolean [] marca = new boolean[grafo.getSize()];
			
		}
		return lista;
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
