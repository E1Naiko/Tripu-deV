/*
10. Escriba un programa que lea un n�mero entero n y luego reserve memoria en forma din�mica para
    un arreglo de n elementos double. Inicialice las posiciones del arreglo a partir de valores ingresados
    por teclado y a continuaci�n imprima el promedio de todos ellos.
        a. Empleando notaci�n de arreglos.
        b. Empleando notaci�n de punteros.

    Por �ltimo, libere la memoria reservada.

Nota: modularice la reserva de memoria, la inicializaci�n, el c�lculo del promedio y la liberaci�n de
memoria.
*/

#include <stdio.h>
#include <stdlib.h>

double * reservArreglo(int);
void innitArreglo(double *, int);
double calcPromedio1(double*, int);
double calcPromedio2(double*, int);
void liberarMemoria(double*);

int main()
{
    int n;
    printf("Ingrese un entero: ");
    scanf("%d", &n);

    double * arregloDin = reservArreglo(n);
    innitArreglo(arregloDin, n);

    printf("\nPromedio 1: %lf", calcPromedio1(arregloDin, n));
    printf("\nPromedio 2: %lf", calcPromedio1(arregloDin, n));

    liberarMemoria(arregloDin);
    return 0;
}

double * reservArreglo(int n){
    double *a = (double*) malloc(n*sizeof(double));
    return a;
}

void innitArreglo(double *a, int n){
    int i;
    double aux;
    for (i=0; i<n; i++){
        scanf("%lf,", &aux);
        *(a+i) = aux;
    }
}

double calcPromedio1(double* a, int n){
    int i;
    double res = 0;

    for (i=0; i<n; i++){
        res += *(a+i);
    }

    return (double)res/n;
}

double calcPromedio2(double*a, int n){
    int i;
    double res = 0;

    for (i=0; i<n; i++){
        res += a[i];
    }

    return (double)res/n;
}

void liberarMemoria(double* a){
    free(a);
}
