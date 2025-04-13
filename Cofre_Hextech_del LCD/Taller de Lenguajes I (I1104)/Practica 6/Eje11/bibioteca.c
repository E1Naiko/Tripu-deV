#include <stdio.h>
#include <stdlib.h>
#include "bibioteca.h"
#include <string.h>
#define MAX_LENGTH 256
#define COMPROBAR_ERROR(M) if ( (M) == NULL) { \
    printf("Error \n"); \
    return 1; \


diccionario* crear_Diccionario() {
    diccionario * dic;
    int i;
    dic=(diccionario*) malloc(sizeof(diccionario));
    COMPROBAR_ERROR(dic);
    for (i=0; i< MAX_LENGTH; i++) {
        dic->tabla[i]= NULL;
    }
    return dic;
}

int agregar_Palabra(diccionario *d,const char* palabra) {
    int i;
    nodo_t* actual;nodo_t* nuevo;
    actual= d->tabla[MAX_LENGTH];
    nuevo= (nodo_t*) malloc(sizeof(nodo_t));
    nuevo->palabra= strdup(palabra);
    nuevo->sig= d->tabla[MAX_LENGTH];
    d->tabla[MAX_LENGTH]= nuevo;
    return 0;
}

int existe_Palabra(diccionario* d, const char* palabra) {
    nodo_t* actual;
    actual= d->tabla[MAX_LENGTH];
    while (actual != NULL) {
        if (strcmp(actual->palabra,palabra)) {
            return 0;
        }
        actual= actual->sig;
    }
    return 1;
}

int eliminar_Palabra(diccionario* d, const char* palabra) {
    nodo_t* actual;
    nodo_t* anterior;
    actual= d->tabla[MAX_LENGTH];
    anterior= NULL;
    while (actual != NULL) {
        if (strcmp(actual->palabra,palabra)){
            if(anterior == NULL) {
                d->tabla[MAX_LENGTH]= actual->sig;
            } else {
                anterior->sig= actual->sig;
            }
            free(actual);
            return 0;
        }
        anterior= actual;
        actual= actual->sig;
    }
    return 1;
}
