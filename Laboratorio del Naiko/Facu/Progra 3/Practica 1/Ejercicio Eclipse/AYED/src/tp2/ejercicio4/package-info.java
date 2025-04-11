package tp2.ejercicio4;

/*
 * Una red binaria es una red que posee una topología de árbol binario lleno. Ejemplo:
 * 
 *          10
 *     2           3
 *   5    4      9    8
 *  7 8  5 6   12 8  2 1
 * 
 * Los nodos que conforman una red binaria llena tiene la particularidad de que todos ellos conocen
 * cuál es su retardo de reenvío. El retardo de reenvío se define como el período comprendido entre
 * que un nodo recibe un mensaje y lo reenvía a sus dos hijos.
 * 
 * Su tarea es calcular el mayor retardo posible, en el camino que realiza un mensaje desde la raíz
 * hasta llegar a las hojas en una red binaria llena. En el ejemplo, debería retornar 10+3+9+12=34
 * 
 * (Si hay más de un máximo retorne el último valor hallado).
 * Nota: asuma que cada nodo tiene el dato de retardo de reenvío expresado en cantidad de
 * segundos.
 * 
 * a) Indique qué estrategia (recorrido en profundidad o por niveles) utilizará para resolver el
 * problema. 
 * 
 * 	RTA: elijo usar un recorrido en profundidad, ya que no necesito todos los datos de todo el arbol
 * 		solamente debo obtener el mayor entre los 2 hijos actuales hasta llegar a las hojas
 * 
 * b) Cree una clase Java llamada RedBinariaLlena donde implementará lo solicitado en el
 * método retardoReenvio():int
*/