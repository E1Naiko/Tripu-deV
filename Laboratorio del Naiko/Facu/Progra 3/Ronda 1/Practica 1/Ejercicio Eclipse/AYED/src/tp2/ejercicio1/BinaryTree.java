package tp2.ejercicio1;

import tp1.ejercicio8.Queue;

public class BinaryTree <T> {

	private T data;
	private BinaryTree<T> leftChild;   
	private BinaryTree<T> rightChild; 


	public BinaryTree() {
		super();
	}

	public BinaryTree(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	/**
	 * Preguntar antes de invocar si hasLeftChild()
	 * @return
	 */
	public BinaryTree<T> getLeftChild() {
		return leftChild;
	}
	/**
	 * Preguntar antes de invocar si hasRightChild()
	 * @return
	 */
	public BinaryTree<T> getRightChild() {
		return this.rightChild;
	}

	public void addLeftChild(BinaryTree<T> child) {
		this.leftChild = child;
	}

	public void addRightChild(BinaryTree<T> child) {
		this.rightChild = child;
	}

	public void removeLeftChild() {
		this.leftChild = null;
	}

	public void removeRightChild() {
		this.rightChild = null;
	}

	public boolean isEmpty(){
		return (this.isLeaf() && this.getData() == null);
	}

	public boolean isLeaf() {
		return (!this.hasLeftChild() && !this.hasRightChild());

	}

	public boolean hasLeftChild() {
		return this.leftChild!=null;
	}

	public boolean hasRightChild() {
		return this.rightChild!=null;
	}
	@Override
	public String toString() {
		return this.getData().toString();
	}

	public  int contarHojas() {
		int cant = 0;
		if (data != null) {
			if (this.isLeaf()) {
				cant++;
			}
		}

		if (this.hasLeftChild()) {
			cant += this.leftChild.contarHojas();
		}

		if (this.hasRightChild()) {
			cant += this.rightChild.contarHojas();
		}

		return cant;
	}

	public BinaryTree<T> espejo() {
		// Crear una nueva raíz para el árbol espejo
		BinaryTree<T> nuevo = new BinaryTree<>(this.getData());

		// Si el árbol actual tiene hijos, procesarlos recursivamente
		if (this.hasLeftChild()) {
			nuevo.addRightChild(this.getLeftChild().espejo()); // Intercambiamos al espejo
		}
		if (this.hasRightChild()) {
			nuevo.addLeftChild(this.getRightChild().espejo()); // Intercambiamos al espejo
		}

		return nuevo; // Devolver el árbol binario espejo
	}

	public void entreNiveles(int n, int m) {
		if (n > m || n < 0) {
			throw new IllegalArgumentException("Los niveles deben cumplir con 0 ≤ n ≤ m.");
		}

		Queue<BinaryTree<T>> cola = new Queue<>();
		cola.enqueue(this); // Insertar la raíz
		cola.enqueue(null); // Marcador de nivel

		int nivelActual = 0;

		while (!cola.isEmpty() && nivelActual <= m) {
			BinaryTree<T> nodo = cola.dequeue();

			if (nodo != null) {
				if (nivelActual >= n && nivelActual <= m) {
					System.out.print(nodo.getData() + " "); // Imprimir el nodo
				}
				// Agregar hijos a la cola para el siguiente nivel
				if (nodo.hasLeftChild()) {
					cola.enqueue(nodo.getLeftChild());
				}
				if (nodo.hasRightChild()) {
					cola.enqueue(nodo.getRightChild());
				}
			} else if (!cola.isEmpty()) {
				nivelActual++; // Pasar al siguiente nivel
				cola.enqueue(null); // Nuevo marcador de nivel
			}
		}
		System.out.println(); // Nueva línea al terminar
	}

}

