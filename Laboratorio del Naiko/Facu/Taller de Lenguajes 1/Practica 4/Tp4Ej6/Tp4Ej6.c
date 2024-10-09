/* SIN TERMINAR
6. Defina la estructura de una lista enlazada de enteros. Implemente las siguientes funciones:
    a. Inicializar la lista.
    b. Eliminar todos los elementos de la lista.
    c. Agregar un elemento al principio de la lista.
    d. Agregar un elemento al final de la lista.
    e. Calcular la cantidad de elementos de la lista.
    f. Imprimir todos los elementos separados por coma.
*/

#include <stdio.h>
#include <stdlib.h>

typedef struct nodo{
    int valor;
    struct nodo* sig;
}Nodo_t;

Nodo_t* innitLista();
void liberarLista(Nodo_t*);
void agregarAlInicio(Nodo_t*, int);
void agregarAlFinal(Nodo_t*, int);
int calcularCantidadElementos(const Nodo_t* const);
void imprimirLista(Nodo_t*);

int main()
{
    struct nodo * lista;
    lista = innitLista();

    liberarLista(lista);

    return 0;
}

Nodo_t* innitLista(){
    Nodo_t * L = NULL;

    return L;
}

void liberarLista(Nodo_t* lista){
    Nodo_t * aux;
    while (lista){
        aux = lista;
        lista = lista->sig;
        free(aux);
    }
}

void agregarAlInicio(Nodo_t* lista, int val){
}

void agregarAlFinal(Nodo_t* lista, int val){
}

int calcularCantidadElementos(const Nodo_t* const lista){
    return 0;
}

void imprimirLista(Nodo_t* lista){
    printf("\n");
    while (lista){
        printf(" %d, ", lista->valor);
        lista = lista->sig;
    }
}
