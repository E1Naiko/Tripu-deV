/*
12. Escriba un programa que imprima la raíz cuadrada, el cuadrado y el cubo de los números enteros
comprendidos en el rango 1..10.

Nota: para calcular la raíz cuadrada y la potencia de un número investigue las funciones sqrt()
y pow(), ambas de la librería <math.h>.
*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
void calcular(int);
int main()
{
    int val;
    for (val=1; val<=10; val++)
        calcular(val);
    return 0;
}

void calcular(int valor){
    printf(" - La raiz cuadrada de %d es %.2f aproximadamente.\n", valor, sqrt(valor));
    printf(" - El cuadrado de %d es %.0f.\n", valor, pow(valor,2));
    printf(" - El cubo de %d es %.0f.\n", valor, pow(valor,3));
    return;
}
