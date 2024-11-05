/*
9.  Implemente la biblioteca imath.h, la cual contiene funciones matemáticas para enteros. La misma debe
    contener las siguientes funciones:

    a. int potencia(int x, int y) – Eleva x a la y-ésima potencia.
    b. int cuadrado(int x) – Eleva x al cuadrado.
    c. int cubo(int x) – Eleva x al cubo.
    d. int absoluto(int i) – Retorna el valor absoluto entero de i.
    e. int factorial (int i) – Retorna el factorial de i.
    f. int sumatoria (int i) – Retorna la sumatoria de 0 hasta i.
    g. int multiplo (int x, int y) – Retorna 1 si y es divisor de x, 0 en otro
    caso.
    h. int divisor (int x, int y) – Retorna 1 si y es múltiplo de x, 0 en otro
    caso.
    i. int par (int i) – Retorna 1 si i es par, 0 en otro caso.
    j. int impar (int i) – Retorna 1 si i es impar, 0 en otro caso.

    Una vez implementadas todas las funciones de biblioteca, escriba un programa que lea números enteros e
    imprima el cuadrado y el cubo de aquellos números que son pares y el factorial de aquellos que son
    impares. La lectura finaliza con el ingreso del 0.
*/

#include <stdio.h>
#include <stdlib.h>
#include "imath.h"

int main()
{
    int x=6, y=6, i=5;
    printf("x=%d, y=%d, i=%d\n", x, y, i);
    printf("Potencia: %d^%d = %d\n", x, y, potencia(x, y));
    printf("Cuadrado: %d^2 = %d\n", x, cuadrado(x));
    printf("Cubo: %d^3 = %d\n", x, cubo(x));
    printf("Absoluto: |%d| = %d\n", -x, absoluto(-x));
    printf("Factorial: %d! = %d\n", x, factorial(x));
    printf("Sumatoria: Sum(0..%d) = %d\n", x, sumatoria(x));
    printf("Multiplo: %d es multiplo de %d? %d\n", y, x, multiplo(y, x));
    printf("Divisor: %d es divisor de %d? %d\n", x, y, divisor(x, y));
    printf("Par: %d es par? %d\n", x, par(x));
    printf("Impar: %d es impar? %d\n", x, impar(x));

    return 0;
}
