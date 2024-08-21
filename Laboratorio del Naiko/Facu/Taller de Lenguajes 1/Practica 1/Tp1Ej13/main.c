/*
13. Un número primo es un número natural mayor que 1, que tiene dos divisores distintos
únicamente: él mismo y el 1.

a. Escriba una función que reciba como parámetro un número entero n y determine si el
mismo es primo o no.

b. Escriba un programa que lea números enteros desde teclado hasta que la cantidad de
números primos leídos sea 5.
*/
#include <stdio.h>
#include <stdlib.h>
#define FIN 5

int esPrimo(unsigned int);

int main()
{
    unsigned int i, n;
    for(i=1;i<=FIN;i++){
        if(esPrimo(i))
            printf(" - %d es primo.\n", i);
    }

    for(i=1;i<=FIN;i++){
        printf("Ingrese un entero: ");
        scanf("%d",&n);
        if(esPrimo(n))
            printf(" - %d es primo.\n", n);
        else printf(" - %d NO es primo.\n", n);
        //fflush(stdin);
    }
    return 0;
}

int esPrimo(unsigned int n){
    int es = 0,veces = 0, i=1;

    while(i<=n){
        if (n % i==0) veces++;
        i++;
    }
    if (veces<=2) es=1;

    return es;
}
