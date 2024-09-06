/*

1. Escriba un programa que lea palabras desde teclado hasta leer la palabra "ZZZ". Informe la cantidad
de palabras de longitud 5.

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FIN "ZZZ"
#define DIMF 50
#define LONGITUD 5

int main()
{
    char str[DIMF];
    int palabrasDeLongitud = 0;

    printf("Ingrese una palabra: ");
    scanf("%s", str);

    while (strcmp(str, FIN)){
        if (strlen(str) == LONGITUD)
            palabrasDeLongitud++;

        printf("\nIngrese otra palabra o %s para terminar: ", FIN);
        scanf("%s", str);
    }

    printf("Cantidad de palabras de longitud %d: %d", LONGITUD, palabrasDeLongitud);

    return 0;
}
