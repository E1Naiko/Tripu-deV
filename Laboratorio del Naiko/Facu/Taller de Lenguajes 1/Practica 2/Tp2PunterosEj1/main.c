/*
Rehaga el ejercicio 2 de la sección Arreglos Estáticos, pero en este caso escribiendo una única función
que retorne los 3 valores pedidos.

reciban un arreglo unidimensional de float y devuelva
a. retorne el promedio de sus valores.
b. retorne el mínimo de sus valores.
c. retorne la posición del máximo de sus valores

*/
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <FLOAT.H>
#include <math.h>

#define DIMF 20

void cargarArreglo(float []);
void imprimirArreglo(float []);
void laMismisima(float [], float *, float*, int *);

int main()
{
    float arregloFlotante[DIMF];
    float promedio, minimo;
    int *posMaximo;

    cargarArreglo(arregloFlotante);

    imprimirArreglo(arregloFlotante);

    laMismisima(arregloFlotante, &promedio, &minimo, &posMaximo);
    printf("\n\nPromedio : %f - Minimo: %f - Posicion del Maximo: %d -\n", promedio, minimo, posMaximo);

    return 0;
}

void cargarArreglo(float A[]){
    int i;
    srand(time(NULL));
    for (i=0; i<DIMF; i++){
        A[i]= pow(-1, rand()) * (float) rand()/rand()+1;
    }
}

void imprimirArreglo(float A[]){
    int i;
    printf("\nArreglo [%.2f",A[0]);
    for (i=1; i < DIMF; i++){
        printf("|%.2f", A[i]);
    }
    printf("]");
}

void laMismisima(float A[], float *promedio, float *minimo, int *posMaximo){
    int i;
    float sumatoria = 0,
        maximo = FLT_MIN;

    *promedio = 0;
    *minimo = FLT_MAX;
    *posMaximo = 0;

    for (i=0; i < DIMF; i++){
        sumatoria += A[i];

        /* calculo el mínimo de sus valores */
        if (A[i] < *minimo)
            *minimo = A[i];

        /* la posición del máximo de sus valores */
        if (A[i] > maximo){
            *posMaximo = i;
            maximo = A[i];
        }
    }

    *promedio = (float) sumatoria / DIMF;
}
