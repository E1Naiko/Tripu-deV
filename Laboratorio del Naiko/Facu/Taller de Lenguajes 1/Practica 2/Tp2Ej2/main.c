/*
2. Escriba 3 funciones que reciban un arreglo unidimensional de float y que:
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
float devolverPromedio(float []);
float devolverValorMinimo(float []);
int devolverPosMaximo(float []);

int main()
{
    float arregloFlotante[DIMF];
    cargarArreglo(arregloFlotante);

    imprimirArreglo(arregloFlotante);
    printf("\nPromedio: %.2f ", devolverPromedio(arregloFlotante));
    printf("\nMinimo: %.2f ", devolverValorMinimo(arregloFlotante));
    printf("\nPosicion maximo: %d ", devolverPosMaximo(arregloFlotante));

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

float devolverPromedio(float A[]){
    int i;
    float sumatoria = 0;

    for (i=0; i < DIMF; i++){
        sumatoria += A[i];
    }

    return (float) sumatoria / DIMF;
}

float devolverValorMinimo(float A[]){
    int i;
    float minimo = FLT_MAX;

    for (i=0; i < DIMF; i++){
        if (A[i] < minimo)
            minimo = A[i];
    }

    return minimo;
}

int devolverPosMaximo(float A[]){
    int i, pos = 0;
    float maximo = FLT_MIN;

    for (i=0; i < DIMF; i++){
        if (A[i] > maximo){
            pos = i;
            maximo = A[i];
        }
    }

    return pos;
}
