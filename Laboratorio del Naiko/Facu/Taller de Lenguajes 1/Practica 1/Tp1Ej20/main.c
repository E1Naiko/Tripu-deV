/*
    20. Desarrolle una función llamada damePar(), la cual debe retornar un número entero. damePar()
    devuelve 0 en el primer llamado, 2 en el segundo, 4 en el tercero, y así sucesivamente. Luego,
    escriba un programa que lea un número entero positivo n desde teclado y utilizando damePar()
    imprima los primeros n números pares. No utilice variables globales.
*/

#include <stdio.h>
#include <stdlib.h>

int damePar();
int main()
{
    int i;
    unsigned int n;
    printf("Introduzca un numero: ");
    scanf("%d", &n);
    printf("Primeros %d numeros pares:", n);
    for (i=0; i<n; i++)
        printf("%d, ", damePar());
    return 0;
}

int damePar(){
    static int n=-2;
    return n+=2;
}
