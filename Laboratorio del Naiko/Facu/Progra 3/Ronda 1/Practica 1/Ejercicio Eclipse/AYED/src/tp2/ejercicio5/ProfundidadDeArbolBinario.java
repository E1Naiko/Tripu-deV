package tp2.ejercicio5;

import tp1.ejercicio8.Queue;
import tp2.ejercicio1.BinaryTree;

public class ProfundidadDeArbolBinario {
	public BinaryTree<Integer> arbol;
	
	public int sumaElementosProfundidad (int p) {
		int res = 0;
		Queue<Integer> cola = new Queue<Integer>();
		
		
		while (!cola.isEmpty()) {
			res += cola.dequeue();
		}
		
		return res;
	}
	
}

/*
 * package tp1.ejercicio1;
 * 	import tp1.Queue;
 * 	public class BinaryTree<T> {
 * 		. . .
 * 		public void printLevelTraversal() {
 * 			BinaryTree<T> ab = null;
 * 			Queue<BinaryTree<T>> cola = new Queue<BinaryTree<T>>();
 * 			cola.enqueue(this);
 * 			cola.enqueue(null);
 * 			while (!cola.isEmpty()) {
 * 				ab = cola.dequeue();
 * 				if (ab != null) {
 * 					System.out.print(ab.getData());
 * 					if (ab.hasLeftChild()) {
 * 						cola.enqueue(ab.getLeftChild());
 * 					}
 * 					if (ab.hasRightChild()) {
 * 						cola.enqueue(ab.getRightChild());
 * 					}
 * 				} else if (!cola.isEmpty()) {
 * 					System.out.println();
 * 					cola.enqueue(null);
 * 				}
 * 			}
 * 		}
 * 		. . .
 * 	}
 */