package tp3.ejercicio1;

import java.util.List;
import java.util.LinkedList;


public class GeneralTree<T> {

	private T data;
	private List<GeneralTree<T>> children = new LinkedList<GeneralTree<T>>();

	public GeneralTree(T data) {
		this.data = data;
	}

	public GeneralTree(T data, List<GeneralTree<T>> children) {
		this(data);
		this.children = children;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public void setChildren(List<GeneralTree<T>> children) {
		if (children != null)
			this.children = children;
	}

	public List<GeneralTree<T>> getChildren() {
		return this.children;
	}

	public void addChild(GeneralTree<T> child) {
		this.getChildren().add(child);
	}

	public boolean isLeaf() {
		return !this.hasChildren();
	}

	public boolean hasChildren() {
		return children != null && !children.isEmpty();
	}

	public boolean isEmpty() {
		return this.data == null && !hasChildren();
	}

	public void removeChild(GeneralTree<T> child) {
		if (this.hasChildren()) {
			List<GeneralTree<T>> children = this.getChildren();
			if (children.contains(child))
				children.remove(child);
		}
	}

	private int alturaPreOrden(GeneralTree<T> a, int profundidad) {
		int res = 0;

		if (a!=null) {
			int profundidadAct = 1;
			if (a.hasChildren()) {
				List<GeneralTree<T>> children = a.getChildren();
				for(GeneralTree<T> child: children) {
					profundidadAct = 1 + alturaPreOrden(child, profundidadAct);
				}
			}
		}

		return res;
	}

	public int altura() {
		// devuelve la altura del árbol, es decir, la longitud del camino más
		// largo desde el nodo raíz hasta una hoja.
		int res = 0;

		res = alturaPreOrden(this, 0);

		return res;
	}

	public int nivel(T dato) {
		int res = 0;
		return res;
	}

	public int ancho() {
		int res = 0;
		return res;
	}
}
