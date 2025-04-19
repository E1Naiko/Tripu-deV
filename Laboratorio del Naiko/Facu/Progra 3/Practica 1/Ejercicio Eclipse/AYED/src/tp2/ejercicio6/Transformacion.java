package tp2.ejercicio6;

import tp2.ejercicio1.BinaryTree;

public class Transformacion{
	public BinaryTree<Integer> original;
	// tengo que crear un arbol nuevo con los datos originales 
	
	private BinaryTree<Integer> calculo(BinaryTree<Integer> act){
		int aux = 0;
		if (act != null) {
			if (act.hasLeftChild()) {
				aux += act.getLeftChild().getData() + calculo(act.getLeftChild()).getData();
			}
			if (act.hasRightChild()) {
				aux += act.getRightChild().getData() + calculo(act.getRightChild()).getData();
			}
		}
		return null;
	}
	
	public BinaryTree<Integer> suma(){
		return null;
	}
}
