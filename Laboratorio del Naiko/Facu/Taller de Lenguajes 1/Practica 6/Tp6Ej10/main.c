/*
    10.
    a. Implemente la biblioteca istack.h, la cual debe contener tipos y operaciones necesarias para
    manipular una estructura de datos pila que almacene números enteros. Una pila es una estructura de
    datos homogénea y dinámica. El acceso a la misma se dice que es de tipo LIFO (Last In First Out), lo que
    quiere decir que los elementos se recuperan en el orden inverso en que fueron insertados. Implemente al
    menos las siguientes funciones:

        i. Stack* s_create () – Retorna una nueva pila. Se debe invocar antes de manipular cualquiera de ellas.
        ii. int s_push(stack* s, int n) – Apila n en s. Retorna el elemento apilado.
        iii. int s_pop (stack* s) – Desapila un elemento de s.
        iv. int s_top (stack s) – Retorna el próximo elemento que será desapilado.
        v. int s_empty(stack s) – Retorna 1 si s está vacía, 0 en caso contrario.
        vi. int s_length(stack s) – Retorna la cantidad de elementos apilados en s.

    b. Una vez implementadas todas las funciones de biblioteca, escriba un programa que lea números
    enteros y los inserte en una pila. A continuación, desapile los elementos para verificar si funciona
    correctamente. La lectura finaliza con el ingreso del 0.

    c. Manteniendo la misma interfaz, modifique el tipo de datos stack y reimplemente la biblioteca para
    que la función s_length retorne la cantidad de elementos sin recorrer la pila.
*/

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char * argv[])
{
    if (argc>1){
        printf("Modo debug iniciado:\n\n");
    }
    else
        printf("Modo normal iniciado:\n\n");
    return 0;
}
