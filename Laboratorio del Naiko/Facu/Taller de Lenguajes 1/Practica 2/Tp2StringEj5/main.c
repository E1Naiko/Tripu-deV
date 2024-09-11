/*
5. La función strcpy recibe dos punteros a cadenas de caracteres y copia la cadena apuntada por el
segundo (incluyendo el carácter nulo) en la cadena apuntada por el primero. Además, la función
retorna el primer puntero. Implemente su propia versión de la función strcpy.

Nota: asuma que la primera cadena de caracteres tiene espacio suficiente para almacenar a la
segunda.

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DIMF 51

char * copiarString(char *, char *);

int main()
{
    char str1[DIMF], str2[DIMF];

    printf("Inserte una cadena de caracteres: ");
    scanf("%s", str1);

    printf("Inserte otra cadena de caracteres: ");
    scanf("%s", str2);

    printf("\n String1: %s | String2: %s", str1, str2);
    copiarString(str1, str2);
    printf("\n String1: %s | String2: %s", str1, str2);

    return 0;
}

char * copiarString(char *str1, char *str2){
    int i=0;
    while (*(str2+i) != '\0'){
        *(str1+i) = *(str2+i);
        i++;
    }

    *(str1+i) = *(str2+i);

    return str1;
}
