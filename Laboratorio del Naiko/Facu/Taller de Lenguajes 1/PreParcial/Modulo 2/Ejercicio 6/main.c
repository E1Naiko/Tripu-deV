/*
    6. (1 punto) Escriba un programa que reciba una secuencia de palabras como argumentos a la función main e imprima
    una única frase conformada por la concatenación de todas ellas separándolas entre sí por un blanco. En caso de que
    el programa no reciba ninguna palabra se debe imprimir un mensaje de error.
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(int argc, char * argv[])
{
    char * res;
    int dimTot = 0, i;
    printf("DEBUG - argc = %d\n", argc);
    printf("DEBUG - argv[%d]=%s\n", 0, argv[0]);
    printf("DEBUG - argv[%d]=%s\n", 1, argv[1]);
    if (argc<=1)
        printf("ERROR - No hay palabras en los paratros");
    else{
        res = (char*) malloc(dimTot);
        for (i=1; i<argc; i++){
            dimTot += strlen(argv[i])+1;
            printf("DEBUG - %d - argv[%d]=%s - dimTot = %d\n", i, i, argv[i], dimTot);
            realloc(res, dimTot);
            strcat(res, argv[i]);
            printf("DEBUG - Primer strcat - %s\n", res);
            strcat(res, " ");
            printf("DEBUG - Segundo strcat - %s\n", res);
        }
        printf("%s", res);
    }
    free(res);
    return 0;
}
