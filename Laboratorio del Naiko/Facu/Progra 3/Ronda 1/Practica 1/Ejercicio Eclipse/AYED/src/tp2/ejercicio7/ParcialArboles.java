package tp2.ejercicio7;

import tp2.ejercicio1.BinaryTree;

public class ParcialArboles {
	public BinaryTree<Integer> arbol;
	
	private int cantHijosUnicos(BinaryTree<Integer> act) {
		int res = 0,
				cantIzq = 0,
				cantDer = 0;
		
		BinaryTree<Integer> hijoIzq = act.hasLeftChild() ? act.getLeftChild() : null,
				hijoDer = act.hasRightChild() ? act.getRightChild() : null;
		
		
		
		return res;
	}
	
	public boolean isLeftTree(int num) {
		boolean res = false;
		
		
		
		return res;
	}
}
