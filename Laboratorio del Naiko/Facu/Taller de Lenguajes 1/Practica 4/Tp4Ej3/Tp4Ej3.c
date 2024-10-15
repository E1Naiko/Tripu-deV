/*
3.  Escriba un programa que lea un número entero n desde teclado y luego reserve memoria en forma
    dinámica para un arreglo de n enteros. Inicialícelo con valores aleatorios y a continuación calcule e
    imprima el máximo número almacenado. Por último, libere la memoria reservada dinámicamente.
    Nota: Modularice la reserva de memoria, la inicialización y el cálculo del máximo.
*/
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define MIN -99999
/*int * reservarMemoria(int DIMF);*/
void incializar(int *, int DIMF);
int maximoNumeroAlmacenado(const int * const , int DIMF);
int main()
{
    int n;
    int *arreglo;
    printf("Introduzca la cantidad de elementos del arreglo: ");
    scanf("%d", &n);
    arreglo = calloc(sizeof(n), n);
    free(arreglo);
    return 0;
}
void incializar(int *a, int DIMF){
    /*srand(time(NULL));*/
    int i;
    for(i=0; i<DIMF; i++)
        *(a+i) = rand()%20;
}
int maximoNumeroAlmacenado(const int * const a, int DIMF){
    int res = MIN,
        i;
    int (i=0; i<DIMF; i++)
        if (res < *(a+i))
            res = *(a+i);
    return res;
}