/*
11. Escriba un programa que lea desde teclado dos valores enteros n y m, y luego reserve memoria en
    forma dinámica para una matriz de enteros de n filas por m columnas. Inicialice la matriz creada con
    valores ingresados por teclado. Una vez inicializada, imprima las posiciones de todos aquellos valores
    múltiplos de 3. Por último, libere la memoria reservada.

    Nota: modularice la reserva de memoria, la inicialización, la impresión de las posiciones con valores
    múltiplo de 3 y la liberación de memoria.

*/

#include <stdio.h>
#include <stdlib.h>

int * reservArreglo(int, int);
void innitArreglo(int *, int, int);
void imprimirMultiplos3(int*, int, int);
void liberarMemoria(int*);

int main()
{
    int n, m;
    printf("Ingrese un entero n y un entero m (n,m): ");
    scanf("%d,%d", &n, &m);

    int * arregloEnteros = reservArreglo(n,m);
    innitArreglo(arregloEnteros, n,m);

    imprimirMultiplos3(arregloEnteros, n, m);

    return 0;
}

int * reservArreglo(int n, int m){
    int *a = (int*) malloc(n*m*sizeof(int));
    return a;
}

void innitArreglo(int *a, int n, int m){
    int i, j, aux;
    for (i=0; i<n; i++){
        for (j=0; j<n; j++){
            scanf("%d,", &aux);
            *(a+i*j+j) = aux;
        }
    }
}

void imprimirMultiplos3(int *a, int n, int m){
    int i, j;
    for (i=0; i<n; i++){
        for (j=0; j<n; j++){
            printf("%d,", *(a+i*j+j));
            //if (!(*(a+i*j+j) % 3))
            //    printf("%d,", *(a+i*j+j));
        }
    }
}

void liberarMemoria(int* a){
    free(a);
}
