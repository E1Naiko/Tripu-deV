#include <stdio.h>
#include <stdlib.h>
#include "Funciones.h"
//struct nodo {
//    int dato;
//    struct nodo* sig;
//};
//
//typedef struct nodo* Lista;

void Inicializar(Lista *l)
{
    *l = NULL;
}

void AgregarAdelante (Lista* l, int num)
{ Lista Nue;
    Nue = (Lista) malloc(sizeof(struct nodo));
    Nue->dato = num;
    Nue->sig = *l;
    *l = Nue;
}

void Eliminar (Lista *l)
{ Lista Actual= *l;
  Lista sig;
  while (Actual != NULL){
    sig = Actual->sig;
    free(Actual);
    Actual = sig;
  }
}

void AgregarFinal (Lista *l,int num)
{ Lista aux,nue,ant;
  nue = (Lista)malloc(sizeof(struct nodo));
  nue->dato = num;
  nue->sig = NULL;
  if ((*l) == NULL)
    (*l) = nue;
  else {
    aux = *l;
    while (aux != NULL) {
        ant = aux;
        aux = aux->sig;
    }
    ant->sig = nue;
  }
}

void Recorrer (Lista *l)
{ int cant=0;
    while ((*l) != NULL){
        cant++;
        (*l) = (*l)->sig;
    }
    printf("Cantidad de elementos de la lista: %d \n",cant);
}
void Imprimir (Lista *l)
{
    Lista aux;
    aux = *l;
    while (aux != NULL) {
        printf(" %d,",aux->dato);
        aux = aux->sig;
    }
}

void Multiplos (Lista *l, int num)
{ Lista aux;
    aux = *l;
    while (aux != NULL) {
        if ( num % aux->dato)
            printf("EL %d Es multiplo del numero %d \n",aux->dato,num);
        else
            printf("El numero %d no es multiplo \n",aux->dato);
        aux = aux->sig;
    }
}

void InsertarOrdenado (Lista *l,int num) {
   Lista nue,ant,lugar;
    nue = (Lista)malloc(sizeof(struct nodo));
    nue->dato = num;
    nue->sig = NULL;
    lugar = *l;
    ant = *l;
    while ((lugar != NULL) && (num > lugar->dato)) {
        ant = lugar;
        lugar = lugar->sig;
    }
    if (lugar = *l) {
        nue->sig = *l;
        *l = lugar->sig;
    } else {
        ant->sig = *l;
        *l = nue;
    }
}

void borrarUltimo (Lista * L) {
    Lista *ant, *auxL;
    auxL = *L;
    if(auxL != NULL) {
        ant = auxL;
        while (auxL->sig != NULL) {
            ant = auxL;
            auxL = auxL->sig;
        }
        if (ant == auxL) {
            free(ant);
            *L= NULL;
        } else {
            ant->sig = NULL;
            free(auxL);
        }
    }
}

