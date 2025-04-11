package tp2.ejercicio4;

import tp2.ejercicio1.BinaryTree;

public class RedBinariaLlena {
	private int recorrer(BinaryTree<Integer> arbol) {
		if (arbol != null) {
			if (arbol.hasLeftChild() && arbol.hasRightChild()) {
				if (arbol.getLeftChild().getData() > arbol.getRightChild().getData()) {
					return arbol.getData() + recorrer(arbol.getLeftChild());
				}
				else if (arbol.getLeftChild().getData() < arbol.getRightChild().getData()) {
					return arbol.getData() + recorrer(arbol.getRightChild());
				}
				else {
					int nLeft, nRight;
					nLeft = recorrer(arbol.getLeftChild());
					nRight = recorrer(arbol.getRightChild());
					if (nLeft >= nRight) {
						return arbol.getData() +  nLeft;
					}
					else {
						return arbol.getData() +  nRight;
					}
				}
			}
			else return arbol.getData();
		}
		return 0; // caso hoja, arbol = null
	}
	
	public int retardoReenvio(BinaryTree<Integer> arbol) {
		int res = recorrer(arbol);
		return res;
	}
}
