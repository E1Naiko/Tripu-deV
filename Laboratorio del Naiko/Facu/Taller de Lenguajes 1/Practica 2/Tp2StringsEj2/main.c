/*

2. Escriba un programa que lea palabras desde teclado hasta leer la palabra "XXX". Se requiere
informar la cantidad de palabras ingresadas que terminan con la letra ‘o’.

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FIN "XXX"
#define DIMF 50
#define EMPIEZA_CON 'o'

int main()
{
    char str[DIMF];
    int palabrasEmpiezanCon = 0;

    printf("Ingrese una palabra: ");
    scanf("%s", str);

    while (strcmp(str, FIN)){
        if (str[0] == EMPIEZA_CON)
            palabrasEmpiezanCon++;

        printf("\nIngrese otra palabra o %s para terminar: ", FIN);
        scanf("%s", str);
    }

    printf("Cantidad de palabras que empiezan con %c: %d", EMPIEZA_CON, palabrasEmpiezanCon);
    return 0;
}
