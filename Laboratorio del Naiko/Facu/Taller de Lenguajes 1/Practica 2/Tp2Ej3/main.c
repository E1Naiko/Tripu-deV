#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define DIMF_F 3
#define DIMF_C 3
#define REDONDEADO 10

void cargarMatriz(int [][DIMF_C]);
void multEscalarMatriz(int [][DIMF_C], int);
void imprimirMatriz(int [][DIMF_C]);

int main()
{
    int matriz[DIMF_F][DIMF_C];
    int coeficiente;
    cargarMatriz(matriz);
    imprimirMatriz(matriz);

    printf("\nIntroduzca un entero:");
    scanf("%d", &coeficiente);

    multEscalarMatriz(matriz, coeficiente);
    imprimirMatriz(matriz);

    return 0;
}

void cargarMatriz(int M[][DIMF_C]){
    int i, j;
    srand(time(NULL));
    for (i=0; i<DIMF_F; i++){
        M[i][0] = rand() % REDONDEADO;
        for (j=1; j<DIMF_C; j++){
            M[i][j] = rand() % REDONDEADO;
        }
    }
}

void multEscalarMatriz(int M[][DIMF_C], int c){
    int i, j;
    for (i=0; i<DIMF_F; i++){
        for (j=0; j<DIMF_C; j++){
            M[i][j] *= c;
        }
    }
}

void imprimirMatriz(int M[][DIMF_C]){
    int i, j;

    printf("Matriz:");
    for (i=0; i<DIMF_F; i++){
        printf("\n[");
        printf("%d", M[i][0]);
        for (j=1; j<DIMF_C; j++){
            printf("|%d", M[i][j]);
        }
        printf("]");
    }
}
