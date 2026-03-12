package tp1.ejercicio8;

public abstract class Sequence {
	private int size;
	private boolean isEmpty;

	
	
	public Sequence(int size, boolean isEmpty) {
		this.size = size;
		this.isEmpty = isEmpty;
	}

	
	
	public Sequence() {
	}
	
	
	
	public int getSize() {
		return size;
	}



	public void setSize(int size) {
		this.size = size;
	}



	abstract public boolean isEmpty();



	public void setEmpty(boolean isEmpty) {
		this.isEmpty = isEmpty;
	}



	@Override
	public String toString() {
		return "Sequence [size=" + size + ", isEmpty=" + isEmpty + "]";
	}
}
