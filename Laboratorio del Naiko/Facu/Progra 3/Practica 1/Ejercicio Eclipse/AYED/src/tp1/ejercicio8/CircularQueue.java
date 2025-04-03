/*
 *  * b. Implemente en JAVA las clase CircularQueue de acuerdo con la especificación dada en
 * el diagrama de clases. Defina esta clase dentro del paquete tp1.ejercicio8.
 * 	● shift(): T Permite rotar los elementos, haciéndolo circular. Retorna el elemento
 * 	encolado.
 */

package tp1.ejercicio8;

public class CircularQueue<T> extends Queue<T>{ // RETORNA NULL SI ESTÁ VACIA
	public T shift() {
		T dato = null;
		if (!isEmpty()) {
			dato = dequeue();
			enqueue(dato);
		}
		return dato;
	}
}
