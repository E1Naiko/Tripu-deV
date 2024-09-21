#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdlib.h>
#define COL 4
#define FIL 4
void MostrarMatriz (int [][COL]);
void MatrizTraspuesta(int [][COL]);
int main()
{ int c;
  int matriz [FIL][COL]= {{1,2,3,4},{1,2,3,4},{1,2,3,4},{3,2}};
    printf("Matriz Original ");
    MostrarMatriz(matriz);
    MatrizTraspuesta(matriz);
    printf("\n");
    printf("Matriz Traspuesta: ");
    MostrarMatriz(matriz);
    return 0;
}
void MatrizTraspuesta(int m[][COL])
{ int c,f;
    for (f=0; f < FIL; f++){
        printf("\n");
        for (c=0; c < COL; c++){
            m[f][c] = m[c][f];
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
