#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "Ejer10.h"

int main()
{ int n;
    double *vector;
    printf(" Escribir numero: \n");
    scanf("%d",&n);
    vector = (double *) malloc(n * sizeof(double));
    cargar(vector,n);
    ProcesarVector(vector,n);
    return 0;
}

