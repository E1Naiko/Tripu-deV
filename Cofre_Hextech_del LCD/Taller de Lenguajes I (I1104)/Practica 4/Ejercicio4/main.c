#include <stdio.h>
#include <stdlib.h>
#include <math.h>
void cargar (float *, int);
void imprimir (float[] , int);
void promedio (float, int);
int main()
{ int n;
    float *num;
    printf("Escribir n: \n");
    scanf("%d",&n);
    num = (float*) malloc(n *sizeof(float));
    cargar(num,n);
    imprimir(num,n);
    free(num);
    return 0;
}
void cargar (float *d,int n)
{ int i;
    srand(time(NULL));
    for (i=0; i < n; i++){
        d[i] = (float) rand()/(float)RAND_MAX;
    }
}
void imprimir (float d[],int n)
{ int i;
    for (i=0; i < n; i++){
        printf("%f |", d[i]);
    }
}
