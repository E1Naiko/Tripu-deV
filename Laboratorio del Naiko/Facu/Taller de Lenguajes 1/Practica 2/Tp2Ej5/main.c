/*
Escriba una función que reciba tres matrices A, B y C de mismas dimensiones, y calcule la suma de
A y B en C.
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define DIMF_F 3
#define DIMF_C 4
#define REDONDEADO 10

void cargarMatriz(int [][DIMF_C]);
void imprimirMatriz(int [][DIMF_C]);
void sumaMatrizes(const int [][DIMF_C], const int [][DIMF_C], int [][DIMF_C]);
/*(matriz 1, matriz 2, resultado) matriz1 + matriz2 = resultado*/

int main()
{
    srand(time(NULL));

    int A[DIMF_F][DIMF_C],
    B[DIMF_F][DIMF_C],
    C[DIMF_F][DIMF_C] = {0};

    printf("A:");
    cargarMatriz(A);
    imprimirMatriz(A);

    printf("\n\nB:");
    cargarMatriz(B);
    imprimirMatriz(B);

    printf("\n\nA+B=C");
    sumaMatrizes(A, B, C);
    imprimirMatriz(C);

    return 0;
}

void cargarMatriz(int M[][DIMF_C]){
    int i, j;
    for (i=0; i<DIMF_F; i++){
        M[i][0] = rand() % REDONDEADO;
        for (j=1; j<DIMF_C; j++){
            M[i][j] = rand() % REDONDEADO;
        }
    }
}

void imprimirMatriz(int M[][DIMF_C]){
    int i, j;

    printf("\nMatriz:");
    for (i=0; i<DIMF_F; i++){
        printf("\n[");
        printf("%d", M[i][0]);
        for (j=1; j<DIMF_C; j++){
            printf("|%d", M[i][j]);
        }
        printf("]");
    }
}

void sumaMatrizes(const int A[][DIMF_C], const int B[][DIMF_C], int C[][DIMF_C]){
    int i, j;
    for (i=0; i<DIMF_F; i++){
        for (j=0; j<DIMF_C; j++){
            C[i][j] = A[i][j] + B[i][j];
        }
    }
}
