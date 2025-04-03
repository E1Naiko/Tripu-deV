package tp1.ejercicio8;
/*
 * Una DoubleEndedQueue (o Deque) en Java es una estructura de datos que permite insertar y eliminar
 * elementos desde ambos extremos de la cola, es decir, tanto desde el principio como desde el final.
 * Es útil cuando necesitas una estructura más flexible que una cola (queue) estándar o una pila (stack).
 * */

public class DoubleEndedQueue<T> extends Queue<T> {
	public void enqueueFirst(T nue) {
		super.data.add(0, nue);
	}
}
