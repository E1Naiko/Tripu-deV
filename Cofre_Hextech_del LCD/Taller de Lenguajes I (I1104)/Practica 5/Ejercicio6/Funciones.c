#include <stdio.h>

void inicializarVectores(float max[],float min[],float tot[], int c)
{ int i;
    for (i = 0; i < c ; i++) {
        max[i]= 0;
        min[i]= 999;
        tot[i]= 0;
    }
}

void recorrerVectores(float max[],float min[],float tot[], int c)
{ int i;
    for (i = 0; i < c ; i++) {
        printf("Vector max: %.2f - ",max[i]);
        printf("Vector min: %.2f - ",min[i]);
        printf("Vector tot: %.2f - ",tot[i]);
    }
}
