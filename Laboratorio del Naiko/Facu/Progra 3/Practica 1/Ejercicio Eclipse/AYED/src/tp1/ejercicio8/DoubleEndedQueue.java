package tp1.ejercicio8;

import java.util.LinkedList;

/*
 * Una DoubleEndedQueue (o Deque) en Java es una estructura de datos que permite insertar y eliminar
 * elementos desde ambos extremos de la cola, es decir, tanto desde el principio como desde el final.
 * Es útil cuando necesitas una estructura más flexible que una cola (queue) estándar o una pila (stack).
 * */

public class DoubleEndedQueue<T> extends Queue<T> {
	    private LinkedList<T> list;

	    public DoubleEndedQueue() {
	        this.list = new LinkedList<>();
	    }

	    public void enqueueFirst(T dato) {
	        list.addFirst(dato);
	    }

	    public void enqueue(T dato) {  // Sobreescribir para claridad
	        list.addLast(dato);
	    }
}
