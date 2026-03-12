package tp2.ejercicio3;

import java.util.LinkedList;

import tp2.ejercicio1.BinaryTree;

public class ContadorArbol {
	public BinaryTree<Integer> arbol;

	private void inOrder(LinkedList<Integer> res, BinaryTree<Integer> arbol) {
		if (arbol != null) {
			if (arbol.hasLeftChild()) {
				inOrder(res, arbol.getLeftChild());
			}

			if ((arbol.getData() % 2) == 0)
				res.add(arbol.getData());

			if (arbol.hasRightChild()) {
				inOrder(res, arbol.getRightChild());
			}			
		}
	}

	public LinkedList<Integer> numerosParesInOrder(){
		LinkedList<Integer> res = new LinkedList<Integer>();
		this.inOrder(res, arbol);
		return res;
	}

	private void postOrder(LinkedList<Integer> res, BinaryTree<Integer> arbol) {
		if (arbol != null) {
			if (arbol.hasLeftChild()) {
				postOrder(res, arbol.getLeftChild());
			}

			if (arbol.hasRightChild()) {
				postOrder(res, arbol.getRightChild());
			}	

			if ((arbol.getData() % 2) == 0)
				res.add(arbol.getData());
		}
	}

	public LinkedList<Integer> numerosParesPostOrder(){
		LinkedList<Integer> res = new LinkedList<Integer>();
		this.postOrder(res, arbol);
		return res;
	}
}
