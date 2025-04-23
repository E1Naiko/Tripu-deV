package tp3.ejercicio1;

/* 
 * Ejercicio 1
 * Considere la siguiente especificación de la clase GeneralTree (con la representación de Lista de Hijos)
 * 
 * El constructor GeneralTree(T value) inicializa un árbol que tiene como raíz un nodo y este nodo
 * tiene el dato pasado como parámetro y una lista vacía.
 * 
 * El constructor GeneralTree (T data, List<GeneralTree <T>> children) inicializa un árbol que
 * tiene como raíz a un nodo y este nodo tiene el dato pasado como parámetro y como hijos a la lista:
 * 
 * El método getData():T retorna el dato almacenado en la raíz del árbol.
 * 
 * El método getChildren():Lista<GeneralTree <T>>, retorna la lista de hijos de la raíz del árbol.
 * 
 * El método addChild(GeneralTree <T> child) agrega un hijo al final de la lista de hijos del árbol
 * 
 * El método removeChild(GeneralTree <T> child) elimina del árbol el hijo pasado como parámetro.
 * 
 * El método hasChildren() devuelve verdadero si la lista de hijos del árbol no es null y tampoco es
 * vacía
 * 
 * El método isEmpty() devuelve verdadero si el dato del árbol es null y además no tiene hijos.
 * 
 * Los métodos altura(), nivel(T) y ancho() se resolverán en el ejercicio 3.
 * Analice la implementación en JAVA de las clases GeneralTree brindada por la cátedra.*
 */