#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "Ejer11.h"

void CargarMatriz(int **m, int maxF, int maxC) {
    int fil,col;
    srand(time(NULL));
    for (fil=0; fil < maxF; fil++) {
        for (col=0; col < maxC; col++) {
            m[fil][col]= rand()%21;
        }
    }
}
void ImprimirMatriz(int **m, int ne, int me) {
    int f,c;
    printf("-------------------");
    for (f=0; f < ne; f++) {
        printf("\n");
        for (c=0; c < me; c++) {
            printf ("%d\t ",m[f][c]);
        }
    }
    printf("\n-------------------");
}
void ImprimirMul3(int **m, int ne, int me) {
    int f,c;
    printf("-------------------\n");
    for (f=0; f < ne; f++) {
        for (c=0; c < me; c++) {
            if (m[f][c] % 3==0)
                printf ("%d ",m[f][c]);
        }
    }
    printf("\n-------------------\n");
}
void LiberarMemoria (int **m,int ne,int me){
    int f;
    for (f=0; f < ne; f++) {
            free(m[f]);
        }
    free(m);
}

void CargarVector (int *v, int n) {
    int i;
    srand(time(NULL));
    for (i=0;i<n; i++) {
        v[i] = rand() % 21;
    }
}

void ImprimirVector (int *v, int n) {
    int i;
    printf("Vector: \n");
    printf("------------------------------\n");
    printf("( ");
    for (i=0;i<n; i++) {
        printf("%d ",v[i]);
    }
    printf(" )");
}

void ImprimirMulvector(int *v,int n) {
    int i;
    printf("Los numeros multiplos de 3 del vector: \n");
    for (i=0;i<n; i++) {
        if(v[i] % 3 == 0)
            printf("%d ",v[i]);
    }

}

