package tp2.ejercicio6;

/* 	Cree una clase Java llamada Transformacion que tenga como variable de instancia un árbol
 * binario de números enteros y un método de instancia suma (): BinaryTree<Integer> el cuál
 * devuelve el árbol en el que se reemplazó el valor de cada nodo por la suma de todos los
 * elementos presentes en su subárbol izquierdo y derecho. Asuma que los valores de los subárboles
 * vacíos son ceros. Por ejemplo:
 * 
 *      1		|      D          |      35
 *     / \		|     /  \        |     /  \
 *    2   3		|    C    B       |    4    26
 *    \   / \  -->    \  / \    -->    \   / \
 *     4 5   6	|      0 A  0     |     0 15  0
 *      / \		|       / \       |       / \
 *     7   8	|      0   0      |      0   0
 *
 * A = 7 + 8
 * B = 3+5+6+A
 * C = 4+0
 * D = 2+3+C+B
 *
 * ¿Su solución recorre una única vez cada subárbol? En el caso que no, ¿Puede mejorarla para que
 * sí lo haga?
 * 
 */