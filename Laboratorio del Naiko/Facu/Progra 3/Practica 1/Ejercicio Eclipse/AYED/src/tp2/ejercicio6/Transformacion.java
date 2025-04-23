/*package tp2.ejercicio6;

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
*/
package tp2.ejercicio6;

import tp2.ejercicio1.BinaryTree;

public class Transformacion {
    private BinaryTree<Integer> original;

    private int calcularYActualizar(BinaryTree<Integer> nodo) {
        if (nodo == null) {
            return 0; // Subtree is empty
        }
        int leftSum = calcularYActualizar(nodo.getLeftChild());
        int rightSum = calcularYActualizar(nodo.getRightChild());
        
        // Update current node with sum of left and right subtrees
        int originalValue = nodo.getData();
        nodo.setData(leftSum + rightSum);
        
        // Return total sum including original value
        return nodo.getData() + originalValue;
    }

    public BinaryTree<Integer> suma() {
        if (original != null) {
            calcularYActualizar(original); // Start recursion
        }
        return original;
    }
}