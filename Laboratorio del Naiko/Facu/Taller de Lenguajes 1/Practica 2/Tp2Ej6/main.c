/*
6. Escriba un programa que lea un número entero desde teclado y luego informe la cantidad de veces
que aparece cada dígito en el mismo.
*/

#include <stdio.h>
#include <stdlib.h>

#define DIMF 10

void recorrerNumero(const int, int []);
void imprimirResultado(const int []);

int main()
{
    int numero,
    arregloResultado[DIMF] = {0};

    printf("Introduzca un numero entero: ");
    scanf("%d", &numero);

    recorrerNumero(numero, arregloResultado);
    imprimirResultado(arregloResultado);

    return 0;
}

void recorrerNumero(const int n, int a[]){
    int aux = n;
    while (aux>0){
        a[aux%10]++;
        aux/=10;
    }
}

void imprimirResultado(const int A[]){
    int i;

    printf("\nResultado:");
    for(i=0; i<DIMF; i++)
        printf("\nVeces que aparece %d: %d", i, A[i]);
}
