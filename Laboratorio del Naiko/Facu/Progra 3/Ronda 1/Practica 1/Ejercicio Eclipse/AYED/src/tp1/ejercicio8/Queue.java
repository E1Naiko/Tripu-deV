/* a. Implemente en JAVA la clase Queue de acuerdo con la especificación dada en el
 * diagrama de clases. Defina esta clase dentro del paquete tp1.ejercicio8.
 *  ● Queue() Constructor de la clase
 *  ● enqueue(dato: T): Inserta el elemento al final de la cola
 *  ● dequeue():T Elimina el elemento del frente de la cola y lo retorna. Si la cola
 *  está vacía se produce un error.
 *  ● head(): T Retorna el elemento del frente de la cola. Si la cola está vacía se
 *  produce un error.
 *  ● isEmpty(): boolean Retorna verdadero si la cola no tiene elementos y falso en
 *  caso contrario
 *  ● size():int Retorna la cantidad de elementos de la cola.
 *  ● toString(): String Retorna los elementos de la cola en un String
*/

package tp1.ejercicio8;

import java.util.ArrayList;
import java.util.List;

public class Queue<T> extends Sequence {
	List<T> data;
	
	public Queue() {
		this.data = new ArrayList<T>();
	}
	
	
	
	public void enqueue(T dato) {
		data.add(dato);
	}
	
	
	
	public T dequeue() {
		return data.remove(0);
	}
	
	
	
	public T head() {
		return data.get(0);
	}
	
	
	
	public int size() {
		return data.size();
	}
	
	
	
	public boolean isEmpty() {
		return data.size()==0;
	}
	
	
	
	@Override
	public String toString() {
		String str = "[";
		for(T d: data)
			str = str + d +", ";
		str = str.substring(0, str.length()-2)+"]";
		return str;
	}
}
