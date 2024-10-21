/*
5)  Escriba un programa que permita a un usuario consultar si un conjunto de palabras existe o no en
    un diccionario. El usuario ingresa de a una palabra y la consulta finaliza cuando ingresa la palabra
    “ZZZ”. Para cada palabra ingresada se debe informar si la misma pertenece o no al diccionario.

    El diccionario consiste en un archivo de texto y las palabras se encuentran ordenadas en forma
    ascendente (una por línea). Se desea generar una estructura de datos dinámica (memoria RAM) en
    la cual se almacenen las palabras de todo el diccionario. Luego, verifique la pertenencia de las
    palabras ingresadas por el usuario utilizando dicha estructura en lugar del archivo.

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DIMF_C 50

int main()
{
    int i = 0;
    FILE * arch;
    arch = fopen("pruebatp5.txt", "r");

    char **diccionarioDin,
         palAct[DIMF_C];

    if (arch){
        fscanf(arch, "%s", palAct);
        while (!feof(arch)){
            i++;
            diccionarioDin = realloc(*diccionarioDin, (i+DIMF_C)*sizeof(char*));
            diccionarioDin[i] = (char*) malloc(DIMF_C*sizeof(char));
            strcpy(diccionarioDin[i], palAct);

            fscanf(arch, "%s", palAct);
        }

        fclose(arch);
    }

    return 0;
}
