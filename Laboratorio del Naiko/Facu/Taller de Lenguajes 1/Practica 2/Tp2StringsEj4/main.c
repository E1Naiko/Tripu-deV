/*
4. La función strlen recibe un puntero a una cadena de caracteres y retorna su longitud (sin incluir el
carácter nulo). Implemente su propia versión de la función strlen.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DIMF 51

int longitudString(char *);
int main()
{
    char str[DIMF];
    printf("Inserte una cadena de caracteres: ");
    scanf("%s", str);

    printf("\nLa longitud de la cadena es de %d caracteres.", longitudString(str));

    return 0;
}

int longitudString(char *str){
    int i, n=0;
    for (i=0; i<DIMF; i++){
        if (*(str+i)=='\0')
            break;
        n++;
    }

    return n;
}
