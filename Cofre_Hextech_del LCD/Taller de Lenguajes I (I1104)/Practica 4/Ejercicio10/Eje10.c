#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "Ejer10.h"

void cargar (double *v,int n)
{ int i;
    srand(time(NULL));
    for (i=0; i<n; i++) {
        v[i] = rand();
    }
}

void ProcesarVector (double *v, int n)
{ int i;
  double total =0;
  double prom= 0;
    printf ("Vector Generado: \n");
    printf ("----------------------\n");
    for (i=0; i<n; i++) {
        total = total + v[i];
        printf("%f ",v[i]);
    }
    printf ("\n-----------------------\n");
    prom = total/n;
    printf("\nEL promedio es: %lf y la cantidad de elementos: %d",prom,i);
}
