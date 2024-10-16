/* SIN TERMINAR
6. Defina la estructura de una lista enlazada de enteros. Implemente las siguientes funciones:
    a. Inicializar la lista. ✔
    b. Eliminar todos los elementos de la lista. ✔
    c. Agregar un elemento al principio de la lista.
    d. Agregar un elemento al final de la lista.
    e. Calcular la cantidad de elementos de la lista.✔
    f. Imprimir todos los elementos separados por coma.✔
*/

#include <stdio.h>
#include <stdlib.h>

typedef struct nodo{
    int valor;
    struct nodo* sig;
}Nodo_t;

Nodo_t* innitLista();
void liberarLista(Nodo_t**);
void agregarAlInicio(Nodo_t**, int);
void agregarAlFinal(Nodo_t**, int);
int calcularCantidadElementos(const Nodo_t* const);
void imprimirLista(const Nodo_t* const);

int main()
{
    struct nodo * lista;
    lista = innitLista();

    agregarAlInicio(&lista, 1);
    imprimirLista(lista);

    agregarAlFinal(&lista, 2);
    imprimirLista(lista);

    printf("\nCantidad de elementos en la lista: %d", calcularCantidadElementos(lista));

    liberarLista(&lista);

    imprimirLista(lista);
    return 0;
}

Nodo_t* innitLista(){
    Nodo_t * L = NULL;

    return L;
}

void liberarLista(Nodo_t** lista){
    Nodo_t* aux;
    while (*lista) {
        aux = *lista;
        *lista = (*lista)->sig;
        free(aux);
    }
}

void agregarAlInicio(Nodo_t** lista, int val){
    Nodo_t * aux = (Nodo_t*) malloc(sizeof(Nodo_t));
    if (aux == NULL) {
        printf("Error allocating memory\n");
        return;
    }
    aux->valor = val;
    aux->sig = *lista;  /* Correctly assign aux->sig to point to the current head of the list*/
    *lista = aux;       /* Update the list pointer to point to the new node (aux)*/
}

void agregarAlFinal(Nodo_t** lista, int val){
    Nodo_t* aux = (Nodo_t*) malloc(sizeof(Nodo_t));
    aux->valor = val;
    aux->sig = NULL;

    if (*lista == NULL) {
        *lista = aux;
    } else {
        Nodo_t* temp = *lista;
        while (temp->sig) {
            temp = temp->sig;
        }
        temp->sig = aux;
    }
}

int calcularCantidadElementos(const Nodo_t* const lista){
    int res = 0;
    Nodo_t *aux = lista;
    while (aux){
        ++res;
        aux=aux->sig;
    }

    return res;
}

void imprimirLista(const Nodo_t* const lista){
    const Nodo_t * aux = lista;
    printf("\nImprimiendo Lista: ");
    if (aux == NULL) {
        printf("Lista vacía.");
    } else {
        while (aux){
            printf("%d, ", aux->valor);
            aux = aux->sig;
        }
    }
}
