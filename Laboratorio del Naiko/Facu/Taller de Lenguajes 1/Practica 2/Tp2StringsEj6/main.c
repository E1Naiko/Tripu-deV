/*
6. Escriba un programa que lea una palabra desde teclado y luego informe la cantidad de veces que
aparece cada letra de la palabra leída en ella misma.

Nota: asuma que la palabra está formada sólo por letras minúsculas.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DIMF 51

void contarCantidadLetras(char *);

int main()
{
    char str[DIMF];

    printf("Inserte una cadena de caracteres: ");
    scanf("%s", str);

    contarCantidadLetras(str);

    return 0;
}

void contarCantidadLetras(char *str){
    const int dimFc = 'z'-'a'+1;
    int contador[dimFc],
        i=0, j;

    for (j=0; j<dimFc; contador[j]=0, j++);

    while (*(str+i) !='\0'){
        printf("\nCaracter %c | Posicion %d | contador[%c]=%d", *(str+i), 'z'-*(str+i)+1), *(str+i), contador[]);
        contador['z'-*(str+i)+1]++;
        i++;
    }

    for (j=0; j<dimFc; j++)
        if (contador[j]>0)
            printf("\nCantidad de caracteres %c: %d", ('z'-j+1), contador[j]);
}
