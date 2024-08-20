/*
9. Escriba un programa que lea 2 números enteros y un carácter, el cual debe corresponderse
con un operador matemático (+, -, /, x), y a partir de ellos imprima el resultado de
realizar la operación pedida en pantalla. En caso de que el carácter no represente un
operador válido, imprima un mensaje de error. Reflexione sobre las diferentes
estructuras de control que puede utilizar.

*/

#include <stdio.h>
#include <stdlib.h>
#define TERMINAR -999 // como usar constantes
int main()
{
    int x,y, res;
    char c;
    res=0;

    printf("Introduzca un x, un y y un caracter valido: s,r,p,d.\n");
    scanf("%d %d %c", &x, &y, &c);
    printf("\nx=%d y=%d c=%c", x, y, c);

    switch(c){
        case 's':
            res = x+y;
            break;
        case 'r':
            res = x-y;
            break;
        case 'p':
            res = x*y;
            break;
        case 'd':
            res = x/y;
            break;
        default:
            res = (int) TERMINAR; // las tuve que reconvertir a entero por alguna razon
    }

    printf("\nResultado = %d\n", res);
    printf("ERROR - caracter %d no valido, terminando programa.\n", c);
    return 0;
}
