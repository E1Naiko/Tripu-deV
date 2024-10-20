/*
    Escriba un programa que lea desde teclado un valor entero n y reserve memoria para una matriz
    triangular inferior de orden n de enteros. Como se desea ahorrar espacio de almacenamiento, no se
    deben almacenar los elementos cuyo valor es 0, es decir, sólo se reservará memoria para los valores
    del triángulo inferior de la matriz. Luego, inicialice la estructura con valores aleatorios entre 0 y 20
    e imprímala en pantalla. Por último, libere la memoria reservada.

    Nota: modularice la reserva de memoria, la inicialización, la impresión y la liberación de memoria
*/

#include <stdio.h>
#include <stdlib.h>

int ** reservMemoria(int);
void innitMatriz(int **, int);
void imprimirArreglo(int **, int);
void liberarMemoria(int **, int);

int main()
{
    int DIMF_F;

    printf("Ingrese un entero: ");
    scanf("%d", &DIMF_F);

    int ** arregloEnteros;

    arregloEnteros = reservMemoria(DIMF_F);
    innitMatriz(arregloEnteros, DIMF_F);

    imprimirArreglo(arregloEnteros, DIMF_F);

    liberarMemoria(arregloEnteros, DIMF_F);

    return 0;
}

int ** reservMemoria(int n){
    int ** a,
        i;
    a = (int**) malloc(n*sizeof(int*));
    for (i=0; i<n; i++){
        a[i] = (int*) malloc ((i+1)*sizeof(int));
    }

    return a;
}

void innitMatriz(int **a, int n){
    int i, j;

    for (i=0; i<n; i++){
        for(j=0; j<=i; j++){
            a[i][j] = rand()%20;
        }
    }
}

void imprimirArreglo(int **a, int n){
    int i, j;

    for (i=0; i<n; i++){
        printf("\n");
        for(j=0; j<=i; j++){
            printf("%d, ", a[i][j]);
        }
    }
}

void liberarMemoria(int **a, int n){
    int i;
    for (i=0; i<n; i++){
        free(a[i]);
    }
}
