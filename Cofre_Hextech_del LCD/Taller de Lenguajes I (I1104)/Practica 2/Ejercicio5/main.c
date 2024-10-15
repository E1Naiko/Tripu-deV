#include <stdio.h>
#include <stdlib.h>
#define COL 4
#define FIL 4
void MostrarMatriz (int [][COL]);
void SumaMatriz ( const int [][COL], const int [][COL], int [][COL]);
int main()
{ int matrizA [FIL][COL]= {{1,2,3,4},{1,2,3,4},{1,2,3,4}};
  int matrizB [FIL][COL]= {{1,2,3,4},{1,2,3,4},{1,2,3,4}};
  int matrizC [FIL][COL]= {{0,0},{0,0},{0,0}};
    printf("Matriz Original");
    MostrarMatriz(matrizA);
    printf("\n");
    MostrarMatriz(matrizB);
    printf("\n");
    SumaMatriz(matrizA,matrizB,matrizC);
    printf("Matriz Resultante: ");
    MostrarMatriz(matrizC);
    return 0;
}
void SumaMatriz ( const int a[][COL], const int b[][COL], int cc[][COL])
{ int c,f;
    for (f=0; f < FIL; f++){
        printf("\n");
        for (c=0; c < COL; c++){
            cc[f][c] = a[f][c] + b[f][c];
        }
    }
}
void MostrarMatriz (int m[][COL])
{ int c,f;
    for (f=0; f < FIL; f++){
        printf("\n");
        for (c=0; c < COL; c++){
            printf(" %d",m[f][c]);
        }
    }
}
