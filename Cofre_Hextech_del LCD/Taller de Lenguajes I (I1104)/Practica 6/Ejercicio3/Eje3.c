#include <stdio.h>
#include <stdlib.h>
#include "Ejer3.h"

float Calculos (int a, int b, char ope)
{ float aux;
    switch (ope){
        case '+': aux= a + b; break;
        case '-': aux= a - b; break;
        case '.': aux= a * b; break;
        case '/':
            if (b != 0){
                aux= (float) a /(float) b;
                break;
            }else { printf("\nDividiste por 0 boludito\n");
            }
        default: printf("\nError operador no valido\n");
    }
}
