/*
15. Para todo número natural n, se llama factorial de n al producto de todos los naturales desde 1
hasta n:

Escriba una función que reciba como parámetro un número entero y retorne como resultado el
número factorial del mismo.

a. Resolviéndolo de forma iterativa.
b. Resolviéndolo de forma recursiva.
*/

#include <stdio.h>
#include <stdlib.h>

unsigned int factorialIterativo(unsigned int);
unsigned int factorialRecursivo(unsigned int);

int main()
{
    unsigned int n;
    printf("Introduzca un numero: ");
    scanf("%u",&n);
    printf("Factorial iterativo: %u\n", factorialIterativo(n));
    printf("Factorial recursivo: %u\n", factorialRecursivo(n));
    return 0;
}

unsigned int factorialIterativo(unsigned int n){
    unsigned int res = 1, i;

    for(i=1; i<=n; i++){
        res*=i;
    }
    return res;
}

unsigned int factorialRecursivo(unsigned int n){
    if(n==1) return 1;
    else return n*factorialRecursivo(n-1);
}
