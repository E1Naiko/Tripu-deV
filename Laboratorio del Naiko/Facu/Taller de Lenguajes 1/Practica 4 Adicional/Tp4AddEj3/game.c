#include <stdlib.h>
#include <stdio.h>
#include <time.h>

char** innitGame(int rows, int collumns, int totalBombs){
    int i, j,
        bombsAdded = 0;
    srand(time(NULL));
    char** result = (char**) malloc(rows*sizeof(char*));
    for (i=0; i<rows; i++){
        result[i] = (char*) malloc(collumns*sizeof(char));
    }

    while (bombsAdded<totalBombs){
        for(i=0; i<rows; i++)
            for(j=0; j<collumns; j++){
                result[i][j] = (rand()%totalBombs) ? result[i][j]=' ' : {bombsAdded++; result[i][j]='Δ'};
                if (bombsAdded>=totalBombs)
                    break;
            }
    }
    return result;
}
void endGame(char ** matrix, int rows, int collumns){ // SIN TERMINAR
    int i;
    for(i=0; i<rows; i++)
            free(matrix[i]);
    }
    free(matrix);
}
int play(char **){

}