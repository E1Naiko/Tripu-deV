#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define DIMF 50

int main()
{ int i;
  int cant = 0;
  int cant2 = 0;
  int vector[DIMF];
    printf(" Un vector de numeros aleatorios \n ");
    srand(time(NULL));
    for (i=1; i<51; i++) {
        vector[i] = rand()%10;
        printf("| %d ", vector[i]);
        if (i%2 == 0) {
            if (vector[i]%2 != 0){
                cant = cant + 1;
            }
        }else {
            if (vector[i]%2 == 0) {
                cant2= cant2 + 1;
            }
        }
    }
    printf (" \n -------------------------------------------------------------- \n");
    printf("la cantidad de numeros pares en posicion impares es: %d numeros \n",cant);
    printf("la cantidad de numeros impares en posicion pares es: %d numeros \n",cant2);
    return 0;
}
