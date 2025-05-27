package tp5.ejercicio2;

import java.util.LinkedList;
import java.util.List;

import tp5.ejercicio1.Edge;
import tp5.ejercicio1.Graph;
import tp5.ejercicio1.Vertex;

public class Recorridos<T> {
	/* Esquema recursivo: dado G = (V , E)
	 * 1. Marcar todos los vértices como no visitados.
	 * 2. Elegir vértice u como punto de partida.
	 * 3. Marcar u como visitado.
	 * 4. ∀ v adyacente a u,(u,v) Є E, si v no ha sido visitado, repetir
	 * 	recursivamente (3) y (4) para v.
	 * 
	 * • Finalizar cuando se hayan visitado todos los nodos alcanzables desde u.
	 * • Si desde u no fueran alcanzables todos los nodos del grafo: volver a (2),
	 * 	elegir un nuevo vértice de partida v no visitado, y repetir el proceso
	 * 	hasta que se hayan recorrido todos los vértices.
	 */
	
	private void recorridoDfs(int i, Graph<T> grafo, boolean[] marca, List<T> lista) {
		marca[i] = true;
		Vertex<T> v = grafo.getVertex(i);
		
		lista.addLast(v.getData());
		
		List<Edge<T>> adyacentes = grafo.getEdges(v); //adyacentes
		for (Edge<T> e: adyacentes){
			int j = e.getTarget().getPosition();
			if (!marca[j]) {
				recorridoDfs(j, grafo, marca, lista);
			}
		}
	}

	/**
	 * Genera un lista con los vertices, recorrido Depht First Search (en profundidad)
	 * 
	 * @param dato Dato que contendrá el nuevo vértice
	 */
	public List<T> dfs(Graph<T> grafo) {
		List<T> lista = new LinkedList<T>();
		
		boolean[] marca = new boolean[grafo.getSize()];
		for (int i = 0; i < grafo.getSize(); i++) {
			if (!marca[i]) {
				recorridoDfs(i, grafo, marca, lista);
			}
		}
		return lista;
	}
	
	/**
	 * Genera un lista con los vertices, recorrido Breath First Search (en amplitud)
	 * 
	 * @param dato Dato que contendrá el nuevo vértice
	 */
	public List<T> bfs(Graph<T> grafo) {
		List<T> lista = new LinkedList<T>();
		if (grafo != null) {
			// Inicializo la marca en false
			Boolean[] marca = new Boolean[grafo.getSize()];
			for (int i = 0; i < grafo.getSize(); i++)
				marca[i] = false;

			for (Vertex<T> vertice : grafo.getVertices()) {
				// si el vertice no se visito, lo agrego a la lista
				if (!marca[vertice.getPosition()]) {
					marca[vertice.getPosition()] = true;
					lista.add(vertice.getData());
				}
			}
		}
		return lista;
	}
}
