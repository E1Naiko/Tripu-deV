package Tp2.eje1;

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
		int hojas= 0; 
			if (this.isLeaf() == true) {
				hojas++;
			}
			if(this.hasLeftChild()) {
				hojas+= this.leftChild.contarHojas(); 
			}
			if (this.hasRightChild() ) {
				hojas+= this.rightChild.contarHojas();
			}
		return hojas;
	}
		
    public BinaryTree<T> espejo(){
    	BinaryTree<T> espejoArbol = new BinaryTree<>(this.data);
    	if (this.hasLeftChild()) {
    		espejoArbol.addRightChild(this.leftChild.espejo());
    	}
    	if (this.hasRightChild()) {
    		espejoArbol.addLeftChild(this.rightChild.espejo());
    	}
 	   return espejoArbol;
    }
		
}

