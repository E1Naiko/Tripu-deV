#include <stdlib.h>
#include <stdio.h>

void imprimirTriangulo(int**m, int n){
    int i, j;
    for (i=0; i<n; i++){
        for (j=0; j<i+1;j++){
            printf("%d ", m[i][j]);
        }
        printf("\n");
    }
}
