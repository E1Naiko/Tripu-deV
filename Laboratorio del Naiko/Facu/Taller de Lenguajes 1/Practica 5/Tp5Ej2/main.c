/*
2) Escriba un programa que procese un archivo de texto e informe la cantidad de caracteres
min�sculas, may�sculas y d�gitos que posee.
*/


#include <stdio.h>
#include <stdlib.h>

void imprimirEnConsola(FILE *);

int main()
{
    int minusculas = 0,
        mayusculas = 0,
        digitos = 0;

    FILE * archivoTXT;
    archivoTXT = fopen("textoPrueba.txt", "r");

    char act;
    if (archivoTXT){
        fscanf(archivoTXT,"%c",&act);
        while (!(feof(archivoTXT))){
            if (act>='a' && act<='z')
                ++minusculas;
            if (act>='A' && act<='Z')
                ++mayusculas;
            if (act>='0' && act<='9')
                ++digitos;

            fscanf(archivoTXT,"%c",&act);
        }

        imprimirEnConsola(archivoTXT);
        fclose(archivoTXT);
    }
    printf("\nminusculas: %d - mayusculas: %d - digitos: %d", minusculas, mayusculas, digitos);

    return 0;
}

void imprimirEnConsola(FILE * archivoTXT){
    char act;
    if (archivoTXT){
        fseek(archivoTXT, 0, SEEK_SET);
        printf("\nImprimiendo archivo: ");
        fscanf(archivoTXT,"%c",&act);
        while (!(feof(archivoTXT))){
            printf("%c ", act);
            fscanf(archivoTXT,"%c",&act);
        }
    }
}
