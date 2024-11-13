#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#define DEBUG_STEPS 1
#define DEBUG_STATES 1
#define DEBUG_PRINT_MATRIX 1

#if DEBUG_PRINT_MATRIX
void debugPrintState(char ** m, int rows, int collumns){
    int i, j;
    printf("\nDEBUG - PRINTING CURRENT MATRIX STATE -\n\n");
    for(i=0; i<rows; i++){
        for(j=0; j<collumns; j++)
            printf("%c ", m[i][j]);
        printf("\n");
    }
    printf("\n");
}
#endif

char ** allocMatrix(int rows, int collumns){
    #if DEBUG_STEPS
    printf("DEBUG - STEPS - Allocating8 Memory\n\n");
    #endif
    
    int i, j;
    srand(time(NULL));
    char** result = (char**) malloc(rows*sizeof(char*));
    for (i=0; i<rows; i++){
        result[i] = (char*) malloc(collumns*sizeof(char));
    }
    return result;
}

void setBombs(char ** result, int rows, int collumns, int totalBombs){
    int i, j, bombsAdded = 0;
    #if DEBUG_STEPS
    printf("DEBUG - STEPS - Setting Bombs\n\n");
    #endif
    
    #if DEBUG_STATES
    static int runs = 0;
    #endif
    
    while (bombsAdded<totalBombs){
        #if DEBUG_STATES
            runs++;
        #endif
        for(i=0; i<rows; i++)
            for(j=0; j<collumns; j++){
                if (result[i][j] !='B' && bombsAdded<totalBombs)
                    result[i][j] = (rand()%totalBombs) ? result[i][j]='0' : (bombsAdded++, result[i][j]='B');
                else{
                    if (result[i][j] !='B')
                        result[i][j]='0';
                    else
                        continue;
                }

                #if DEBUG_STATES
                    printf("DEBUG - matrix[%d][%d]=%c - bombsAdded = %d - totalBombs = %d\n", i, j, result[i][j], bombsAdded, totalBombs);
                #endif
            }
        #if DEBUG_PRINT_MATRIX
        debugPrintState(result, rows, collumns);
        #endif
    }
}
void setRowBorderDistance(char** result, int rows, int collumns){
    #if DEBUG_STEPS
    printf("DEBUG - STEPS - Setting Side Distances\n\n");
    #endif

    int i, /*j,*/
        conv_i, conv_j;
    char res;
    
    // M[0][i+1] innit
    ROWSIDE(0,0);

    // M[rows][i-1] innit
    ROWSIDE(rows,1);

    // M[i+1][0] innit
    COLLSIDE(0,0);

    // M[i+1][collumns] innit
    COLLSIDE(collumns,1);
    
    #undef ROWSIDE
    #undef COLLSIDE
    #if DEBUG_PRINT_MATRIX
        debugPrintState(result, rows, collumns);
    #endif
}
void setInsideDistance(char** result, int rows, int collumns){
    #if DEBUG_STEPS
    printf("DEBUG - STEPS - Setting Inside Distances\n\n");
    #endif
    int i, j,
        conv_i, conv_j;
    char res;
    for (i=1; i<rows-1; i++){
        for (j=1; j<collumns-1; j++){
            if (result[i][j] != 'B'){
                res = '0';
                for (conv_i=-1; conv_i<2; conv_i++){
                    for (conv_j=-1; conv_j<2; conv_j++)
                        if (result[i+conv_i][j+conv_j]=='B')
                            res++;
                }
                result[i][j] = res;
            }
        }
    }
    #if DEBUG_PRINT_MATRIX
        debugPrintState(result, rows, collumns);
    #endif
}

char** innitGame(int rows, int collumns, int totalBombs){
    
    char ** result = allocMatrix(rows, collumns);
    
    setBombs(result, rows, collumns, totalBombs);
    setDistance(result, rows, collumns);
    
    return result;
}

void endGame(char ** matrix, int rows){ // SIN TERMINAR
    int i;
    for(i=0; i<rows; i++)
            free(matrix[i]);
    free(matrix);
}
int play(char **){

}