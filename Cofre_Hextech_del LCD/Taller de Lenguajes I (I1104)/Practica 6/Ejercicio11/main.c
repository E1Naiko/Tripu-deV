#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "Ejer11.h"

#define CARGARNUM(A) \
    printf("Numero:\n"); \
    scanf("%d",&A) \

int main() {
    int n,m,i,a;
    int **matriz;
    int *vector;
    CARGARNUM(n);
    CARGARNUM(m);
    vector = (int *) malloc(n*sizeof(int));
    matriz = (int **) malloc(n*sizeof(int*));
    for (i=0; i < n; i++)
        matriz[i] = (int *) malloc(m*sizeof(int));
    CargarVector(vector,n);
    CargarMatriz(matriz,n,m);
    printf("\n");
    ImprimirVector(vector,n);
    printf("\nMatriz: \n");
    ImprimirMatriz(matriz,n,m);
    printf("\nLos Numeros multiplos de 3\n");
    ImprimirMul3(matriz,n,m);
    ImprimirMulvector(vector,n);
    LiberarMemoria(matriz,n,m);
    return 0;
}
