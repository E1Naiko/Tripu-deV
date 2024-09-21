#include <stdio.h>
#include <stdlib.h>
#define COL 4
#define FIL 4
void MostrarMatriz (int [][COL]);
void MulEscalar (int [][COL], int);
int main()
{ int c;
  int matriz [FIL][COL]= {{1,2,3,4},{1,2,3,4},{1,2,3,4}};
    printf("Numero a multiplicar: ");
    scanf("%d",&c);
    printf("Matriz Original");
    MostrarMatriz(matriz);
    MulEscalar(matriz,c);
    printf("\n");
    printf("Matriz Resultante: ");
    MostrarMatriz(matriz);
    return 0;
}
void MulEscalar (int m[][COL], int nu)
{ int c,f;
    for (f=0; f < FIL; f++){
        for (c=0; c < COL; c++){
            m[f][c] = m[f][c]*nu;
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
