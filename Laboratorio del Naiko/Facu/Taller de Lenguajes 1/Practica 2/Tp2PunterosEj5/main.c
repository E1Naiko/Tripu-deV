/*
Escriba una función que reciba un arreglo unidimensional e invierta el orden de sus valores.
Nota: utilice la función swap definida en la Práctica 1.
*/

#include <stdio.h>
#include <stdlib.h>
#define DIMF 10

void cargarArreglo(int []);
void imprimirArreglo(int []);
void swap(int *a, int *b);
void recorrerArreglo(int []);

int main()
{
    int arreglo[DIMF];

    cargarArreglo(arreglo);
    imprimirArreglo(arreglo);

    recorrerArreglo(arreglo);
    imprimirArreglo(arreglo);

    return 0;
}

void cargarArreglo(int A[]){
    int i;
    srand(2);

    for(i=0; i<DIMF; i++){
        A[i] = rand()%20;
    }
}

void imprimirArreglo(int A[]){
    int i;
    printf("\nDEBUG - Arreglo: [");
    printf("%d", A[0]);
    for(i=1; i<DIMF; i++)
        printf("|%d", A[i]);
    printf("]");
}

void recorrerArreglo(int A[]){
    int i,j;
    int mitad = DIMF / 2;

    for(i=0, j=DIMF-1; i<mitad && j>=0; i++, j--){ /* El doble condicional funciona, pero evitarlo*/
        printf("\n Pre A[%d]=%d | A[%d]=%d | ", i, A[i], j, A[j]);

        /* Se puede hacer de 2 formas*/
        /*swap(&A[i], &A[j]);*/ /* Acceso directo de los punteros */
        swap(A+i, A+j); /* Recorriendo los punteros */

        printf("\n Post A[%d]=%d | A[%d]=%d | \n", i, A[i], j, A[j]);
    }
}

void swap(int *a, int *b)
{
    int tmp;
    tmp = *a; // guarda el valor de a
    *a = *b; // almacena b en a
    *b = tmp; // almacena a en b
}
