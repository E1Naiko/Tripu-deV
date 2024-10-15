#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define DIMF 50

float promedio (const float []);
float minimo (float []);
int posMax (float []);

int main()
{ int i;
  int cantI= 0;
  float vector[DIMF];
    printf(" Un vector de numeros flotantes aleatorios \n ");
    srand(time(NULL));
    for (i=1;i<DIMF; i++){
         vector[i] = (float) rand()/(float)RAND_MAX;
         cantI = cantI + 1;
         printf("| %.4f ", vector[i]);
    }
    printf(" \n El promedio entre sus valores es: %.4f \n", promedio(vector));
    return 0;
}
float promedio (const float vector[]) {
    int c=0;
    float i=0;
    float total=0, prom=0;
    for (c=0; c < DIMF; c++) {
        i= i+1;
        total = total + vector[c];
    }
    prom = (total/i);
    return prom;
}
