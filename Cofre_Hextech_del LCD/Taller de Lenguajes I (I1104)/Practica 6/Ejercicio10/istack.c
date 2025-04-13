#include <stdio.h>
#include <stdlib.h>
#include "istack.h"

Stack* s_create () {
    Stack* Pila;
    Pila= (Stack*) malloc(sizeof(Stack));
    Pila->pila= NULL;
    Pila->cantidad= 0;
    return Pila;
}

int s_push(Stack* s, int n) {
    nodo *nue;
    nue = (Stack) malloc (sizeof(struct nodo));
    nue->valor = n;
    (*nue).ptr = s->pila;
    s->pila = nue;
    s->cantidad++;
    return n;
}

int s_pop (Stack* s) {
    nodo* aux;
    int valor;
    aux = s->pila; // en aux esta la pila
    valor= s->cantidad; //copia en valor la cantidad de elementos de la pila
    s->pila= s->pila->ptr; // avanza al sgte nodo
    free(aux); // elimina el nodo de la pila
    s->cantidad--; // resta la cantidad de elementos
    return valor;
}

int s_top (Stack s) {
    nodo* aux;
    aux= s.pila;
    return aux.valor;
}

int s_empty(Stack s) {
    if(s.pila != NULL) {
        return 0;
    } else
        return 1;
}

int s_length(Stack s) {
    int valor;
    valor= s.cantidad;
    return valor;
}
