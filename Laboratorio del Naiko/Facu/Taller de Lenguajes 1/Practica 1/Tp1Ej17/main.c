/*
17. Escriba una función que reciba como argumento un número entero n y que dentro de ella lea n
números flotantes desde teclado. La función debe retornar el mínimo y el máximo número leído.
*/

#include <stdio.h>
#include <stdlib.h>
#define MAX 9999
#define MIN -9999

void minimoYMaximo(float, float *, float *);
int main()
{
    int n;
    float nMin = MIN, nMax = MAX;

    printf("Ingrese una cantidad de numeros a leer: ");
    scanf("%d", &n);
    while (n<0){
        printf("ERROR - la cantidad tiene que ser entera");
        scanf("%d", &n);
    }

    minimoYMaximo(n, &nMin, &nMax);
    printf("El menor numero leido es %f.\n", nMin);
    printf("El mayor numero leido es %f.\n", nMax);
    return 0;
}

void minimoYMaximo(float n, float * minimo, float * maximo){
    int i;
    float act;
    for (i=1; i<=n; i++){
        printf("Ingrese un numero:");
        scanf("%d", &act);
        if (act<*minimo) *minimo=act;
        if (act>*maximo) *maximo=act;
    }
}
