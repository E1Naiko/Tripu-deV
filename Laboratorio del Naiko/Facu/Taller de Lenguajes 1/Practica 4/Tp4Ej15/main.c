/*
15. Escriba un programa que, dado un número entero n ingresado por
teclado, construya una pirámide de pascal de n filas. Un triángulo de
pascal es una serie de filas apiladas que comienza con un elemento y
agrega un elemento más en cada fila. El primer y último elemento de
cada fila es un 1. Los demás elementos se calculan sumando los 2
números superiores de la fila anterior. Por ejemplo, para obtener el
segundo elemento de la cuarta fila (4) deben sumarse el primer (1) y
segundo (3) elemento de la tercera fila de forma que 1+3 = 4. Tenga en
cuenta las siguientes condiciones:
a) Utilizar una estructura de datos eficiente. Contemple la información necesaria para recorrer
la pirámide y liberar la memoria de forma correcta.
b) Implemente una función que dado un entero n retorne una pirámide de pascal de n filas.
c) Implemente una función para imprimir la pirámide.
d) Implemente una función para destruir la pirámide.
*/
#include <stdio.h>
#include <stdlib.h>
#include "UI.h"
#include "TrianguloPascal.h"

int main()
{
    int ** triangulo,
        n;

    printf("Introduzca un n: ");
    scanf("%d", &n);
    triangulo = reservTriangulo(n);
    innitTriangulo(triangulo,n);
    imprimirTriangulo(triangulo, n);
    liberarTriangulo(triangulo, n);

    return 0;
}
