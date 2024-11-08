#include <stdlib.h>
#include <stdio.h>

#define LIM_RAND 21

int ** reservar(int);
void innit(int **, int);
void imprimir(int **, int);
void liberarMem(int **, int);

int main(){
    int n, **matriz, act;

    printf("Ingrese un n: ");
    scanf("%d", &n);

    matriz = reservar(n);
    innit(matriz, n);
    imprimir(matriz, n);

    liberarMem(matriz, n);
    imprimir(matriz, n);
    return 0;
}

int ** reservar(int n){
    int **res, i;

    res = (int**) malloc(n*sizeof(int*));

    for (i=0; i<n; i++)
        *(res+i) = malloc(i+1);
    return res;
}

void innit (int ** m, int n){
    int act, i, j;

    for (i=0; i<n; i++){
        for (j=0; j<i+1; j++){
            printf("\nIngrese un n para la matriz: [%d,%d] = ", i,j);
            scanf("%d",&act);
            m[i][j] = act;
        }
    }
}

void imprimir(int ** m, int n){
    int i, j;

    printf("\nImprimiendo matriz:\n");
    for (i=0; i<n; i++){
        for (j=0; j<(i+1); j++)
            printf("%d ", m[i][j]);
        printf("\n");
    }
}

void liberarMem(int** m, int n){
    int i, j;

    /* CODIGO ORIGINAL - > Ta Mal
    for(i=0; i<n; i++){
        for(j=0; j<i+1; j++)
            free(*(m+j*i)+i);
        free(m+i);
    }
    */
    for(i=0; i<n; i++){
        free(m[i]);
    }
    free(m);
}