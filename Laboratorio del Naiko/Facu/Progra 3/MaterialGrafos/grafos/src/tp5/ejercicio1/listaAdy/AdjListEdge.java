package tp5.ejercicio1.listaAdy;

import tp5.ejercicio1.Edge;
import tp5.ejercicio1.Vertex;

public class AdjListEdge<T> implements Edge<T> {
	private Vertex<T> target;
	private int weight;
	
	public AdjListEdge(Vertex<T> target, int weight){
		this.target = target;
		this.weight = weight;
	}
	
	@Override
	public Vertex<T> getTarget() {
		return target;
	}

	@Override
	public int getWeight() {
		return weight;
	}
}
