package tp5.ejercicio1;

import java.util.ArrayList;
import java.util.List;

import tp5.ejercicio1.Edge;
import tp5.ejercicio1.Vertex;

public class AdjListVertex<T> implements Vertex<T> {
	private T data;
	private int position;
	private List<Edge<T>> edges;
	
	protected AdjListVertex(T data, int position) {
		this.data = data;
		this.position = position;
		this.edges = new ArrayList<>();
	}
	
	@Override
	public T getData() {
		return this.data;
	}

	@Override
	public void setData(T data) {
		this.data = data;
	}

	@Override
	public int getPosition() {
		return this.position;
	}
	
	protected void decrementPosition() {
		this.position--;
	}

	protected void connect(Vertex<T> destination) {
		this.connect(destination, 1);
	}

	protected void connect(Vertex<T> destination, int weight) {
		Edge<T> edge = this.getEdge(destination);
		if (edge == null) {
			// se crea solo si no existe
			this.edges.add(new AdjListEdge<>(destination, weight));
		}
	}

	protected void disconnect(Vertex<T> destination) {
		Edge<T> edge = this.getEdge(destination);
		if (edge != null) {
			this.edges.remove(edge);
		}
	}

	public List<Edge<T>> getEdges() {
		return this.edges;
	}

	/**
	 * Retorna, si es que existe, la arista hacia el vertice recibido.
	 */
	public Edge<T> getEdge(Vertex<T> destination) {
		for (Edge<T> edge : this.edges) {
			if (edge.getTarget() == destination) {
				return edge;
			}
		}
		return null;
	}
}
