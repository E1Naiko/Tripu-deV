/*
4.  Escriba un programa que lea un número entero n desde teclado y luego reserve memoria en forma
    dinámica para un arreglo de n float. Inicialícelo con valores ingresados por teclado y a continuación
    calcule e imprima el promedio de todos ellos. Por último, libere la memoria reservada dinámicamente.

    Nota: Modularice la reserva de memoria, la inicialización y el cálculo del promedio.
*/

#include <stdio.h>
#include <stdlib.h>

float * reserva(int);
void innitArreglo(float *, int);
float promedio(float *, int);

void imprimirArreglo(float *, int);

int main()
{
    int n;
    float * arreglo;

    printf("Ingrese un n: ");
    scanf("%d", &n);

    arreglo = reserva(n);

    innitArreglo(arreglo, n);

    imprimirArreglo(arreglo, n);

    printf("\n Promedio de todos los valores = %.2f", promedio(arreglo, n));

    free(arreglo);
    return 0;
}

float * reserva(int n){
    float * a;
    a = (float*) calloc(n,sizeof(float));
    return a;
}

void innitArreglo(float *a, int n){
    int i;
    for (i=0; i<n; i++){
        printf("\nIngrese un valor flotante (%d/%d): ", i, n);
        scanf("%f", a+i);
    }
}

float promedio(float * a, int n){
    float res = 0;
    int i;
    for(i=0; i<n; i++){
        res+=*(a+i);
    }

    res = (float) res/ (float) n;

    return res;
}

void imprimirArreglo(float *a, int n){
    int i;
    printf("\n[");
    for(i=0; i<n; i++){
        printf("%.2f, ", *(a+i));
    }
    printf("]");
}
