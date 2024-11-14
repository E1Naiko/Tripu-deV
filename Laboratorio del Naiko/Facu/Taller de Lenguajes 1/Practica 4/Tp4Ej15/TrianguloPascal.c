#include <stdlib.h>
#include <stdio.h>
#define DEBUG 0

int ** reservTriangulo(int n){
    int ** result,
        i;

    result = (int**) malloc(n*sizeof(int*));
    for (i=0; i<n; i++)
        result[i] = (int*) malloc((i+1)*sizeof(int));

    return result;
}

void innitTriangulo(int ** m, int n){
    int i,j;
    if (n>0){
        for (i=0; i<n; i++){
            m[i][0] = 1;
            #if DEBUG
            printf("DEBUG - innitTriangulo - m[%d][%d]=%d BORDE IZQ\n", i, 0, m[i][0]);
            #endif // DEBUG
            m[i][i] = 1;
            #if DEBUG
            printf("DEBUG - innitTriangulo - m[%d][%d]=%d BORDE DER\n", i, i, m[i][i]);
            #endif // DEBUG
            for (j=1; j<i; j++){
                m[i][j] = m[i-1][j-1] + m[i-1][j];
                #if DEBUG
                printf("DEBUG - innitTriangulo - m[%d][%d]=%d\n", i, j, m[i][j]);
                #endif // DEBUG
            }
        }
    }
}

void liberarTriangulo(int ** m, int n){
    int i;
    for (i=0; i<n; i++)
        free(m[i]);
    free(m);
}
