
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void inicializarMatriz(int* matriz, int n);
void imprimirMatriz(int* matriz, int n);
void liberarMemoria(int* matriz);

int main() {
    int n,elemento;
    int * matriz;
    printf("Ingrese el orden (n): ");
    scanf("%d", &n);
    elemento = n * (n + 1) / 2;
    matriz = (int*) malloc(elemento*sizeof(int)); ;
    inicializarMatriz(matriz,n);
    imprimirMatriz(matriz,n);
    liberarMemoria(matriz);
    return 0;
}

void inicializarMatriz(int* matriz, int n) {
    int i,j,m = 0;
    srand(time(NULL));
    for (i = 0; i < n; i++) {
        for (j = 0; j <= i; j++) {
            matriz[m++] = rand() % 21;
        }
    }
}

void imprimirMatriz(int* matriz, int n) {
    int i,j,m= 0;
    printf("\nMatriz triangular\n");
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            if (j <= i) {
                printf(" %2d ",matriz[m++]);
            } else {
                printf(" 0 ");
            }
        }
        printf("\n");
    }
}

void liberarMemoria(int* matriz) {
    free(matriz);
}
