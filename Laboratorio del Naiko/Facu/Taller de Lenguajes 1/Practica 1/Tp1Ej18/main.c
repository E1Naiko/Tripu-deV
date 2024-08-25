/*
18. Escriba un programa que imprima 15 números generados pseudo-aleatoriamente. ¿La secuencia
generada es siempre la misma? ¿Por qué? ¿Qué se puede hacer para generar secuencias pseudo-
aleatorias diferentes?

Nota: para generar números en forma pseudo-aleatoria investigue las funciones rand() y
srand(), las cuales se encuentran definidas en la biblioteca <stdlib.h>

*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define FIN 15

int main()
{
    int i, r, sr;
    unsigned int aux = 999;
    srand(time(NULL));
    printf("Rand: ");
    for (i=1; i<FIN; i++){
        r = rand()%50;
        printf("%d, ", r, sr);
    }

    return 0;
}
