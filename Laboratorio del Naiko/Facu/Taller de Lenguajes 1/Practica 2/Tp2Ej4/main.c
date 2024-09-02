/*
Escriba una función que reciba una matriz cuadrada A e imprima en pantalla su matriz transpuesta.
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define DIMF 3
#define REDONDEADO 20

void imprimirMatrizCuadradaTraspuesta(const int [][DIMF]);
void cargarMatriz(int [][DIMF]);
void imprimirMatriz(int [][DIMF]);

int main()
{
    int matrizCuadrada[DIMF][DIMF];

    cargarMatriz(matrizCuadrada);
    imprimirMatriz(matrizCuadrada);

    imprimirMatrizCuadradaTraspuesta(matrizCuadrada);

    return 0;
}

void imprimirMatrizCuadradaTraspuesta(const int M[][DIMF]){
    int i, j;
    int matrizAux [DIMF][DIMF];

    for (i=0; i<DIMF; i++){
        for (j=0; j<DIMF; j++){
            matrizAux[i][j] = M[j][i];
        }
    }

    imprimirMatriz(matrizAux);
}

void cargarMatriz(int M[][DIMF]){
    int i, j;
    srand(time(NULL));
    for (i=0; i<DIMF; i++){
        M[i][0] = rand() % REDONDEADO;
        for (j=1; j<DIMF; j++){
            M[i][j] = rand() % REDONDEADO;
        }
    }
}

void imprimirMatriz(int M[][DIMF]){
    int i, j;

    printf("\nMatriz:");
    for (i=0; i<DIMF; i++){
        printf("\n[");
        printf("%d", M[i][0]);
        for (j=1; j<DIMF; j++){
            printf("|%d", M[i][j]);
        }
        printf("]");
    }
}
