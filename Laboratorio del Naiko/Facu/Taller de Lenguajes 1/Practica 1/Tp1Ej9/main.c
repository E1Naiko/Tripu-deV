/*
9. Escriba un programa que lea 2 números enteros y un carácter, el cual debe corresponderse
con un operador matemático (+, -, /, x), y a partir de ellos imprima el resultado de
realizar la operación pedida en pantalla. En caso de que el carácter no represente un
operador válido, imprima un mensaje de error. Reflexione sobre las diferentes
estructuras de control que puede utilizar.

*/

#include <stdio.h>
#include <stdlib.h>
#define TERMINAR -999
int main()
{
    int x,y, res;
    char c;
    res=0;

    do{
        scanf("%d %d %c", &x, &y, &c);
        printf("x=%d y=%d c=%c", x, y, c);
        switch(c){
            case 's':
                res = x+y;
                printf("Resultado = %d", res);
                break;
            case 'r':
                res = x-y;
                printf("Resultado = %d", res);
                break;
            case 'p':
                res = x*y;
                printf("Resultado = %d", res);
                break;
            case 'd':
                res = x/y;
                printf("Resultado = %d", res);
                break;
            default:
                res= TERMINAR;
                printf("ERROR - caracter %d no valido", c);
        }
    } while (res != TERMINAR);
    return 0;
}
