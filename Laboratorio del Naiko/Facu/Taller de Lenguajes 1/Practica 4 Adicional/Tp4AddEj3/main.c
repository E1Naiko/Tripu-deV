#include <stdlib.h>
#include <stdio.h>
#include "UI.h"
#include "game.h"

#define DEBUG 1
#define STATUS_GAME_GAMEOVER -1
#define STATUS_GAME_WIN 1

#define DIM_ROW 8
#define DIM_COL 8
#define AMM_MINES 10

void updateGameStatus();


int main(){
    int minesFound,
        gameStatus,
        newGame = 0;
    
    do{
        minesFound = 0;
        gameStatus = 0;
        printStarterScreen();
        while (minesFound<AMM_MINES){
            showTableStatus();
            gameStatus = play();
            if (gameStatus == STATUS_GAME_WIN){

            }
            else{gameStatus == STATUS_GAME_GAMEOVER}
                printGameOver();
            
        }

        printf("\nNew Game? (0=NO, 1=YES): ");
        scanf("%d",&newGame);
    } while(!newGame);
} 

int play()
/**/
{

}
void updateGameStatus()
/**/
{

}