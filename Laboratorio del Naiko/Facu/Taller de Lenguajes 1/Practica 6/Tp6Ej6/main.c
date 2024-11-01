/*
    6. Realice un programa que defina una macro AREA_CIRCULO(r) que permita calcular el área de un círculo
    para un radio r. El cuerpo del programa debe generar aleatoriamente 10 valores diferentes que
    representan radios e imprimir el área correspondiente.
*/

#include <stdio.h>
#include <stdlib.h>

#define AREA_CIRCULO(r) (3.14159*r*r)
#define CANT_ELEMENTOS 10
#define NUM_MAYOR 10

int main()
{
    int i;
    unsigned int num;
    for (i=0; i<CANT_ELEMENTOS; i++){
        num = rand()%NUM_MAYOR+1;
        printf("\nArea de un circulo de radio %u: %.5f+-0.00001", num, AREA_CIRCULO(num));
    }
    return 0;
}
