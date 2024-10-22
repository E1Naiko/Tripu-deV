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
#define FIN "ZZZ"

void cargarMatriz(FILE *, char **, int *);
int palabraExiste(char **, int , char []);
void recorrer(char**, int);
void imprimirMatriz(char **, int );

int main()
{
    int dimf_f = 0;
    FILE * arch;
    arch = fopen("pruebatp5.txt", "r");

    char **diccionarioDin;

    diccionarioDin = (char**) malloc(sizeof(char*));
    cargarMatriz(arch, diccionarioDin, &dimf_f);
    printf("\nDIMF_F %d:", dimf_f);

    imprimirMatriz(diccionarioDin, dimf_f);

    recorrer(diccionarioDin, dimf_f);

    return 0;
}

void cargarMatriz(FILE * arch, char ** diccionarioDin, int * DIMF_F){
    char palAct[DIMF_C];
    int i = *DIMF_F;
    if (arch){
        do{
            fscanf(arch, "%s", palAct);
            i++;

            *diccionarioDin = realloc(*diccionarioDin, (i+DIMF_C)*sizeof(char*));
            diccionarioDin[i] = (char*) malloc(DIMF_C*sizeof(char));
            strcpy(diccionarioDin[i], palAct);
        }while (!feof(arch));

        fclose(arch);
    }
    *(DIMF_F) = i;
}

/* PREGUNTAR */
/*void cargarMatriz(FILE * arch, char *** diccionarioDin, int * DIMF_F) {
    char palAct[DIMF_C];
    int i = *DIMF_F;

    if (arch) {
        // Read words from file
        while (fscanf(arch, "%s", palAct) == 1) {
            i++;
            // Reallocate memory for the new word
            *diccionarioDin = realloc(*diccionarioDin, i * sizeof(char*));
            if (*diccionarioDin == NULL) {
                // Handle memory allocation error
                printf("Error reallocating memory.\n");
                return;
            }

            // Allocate memory for the new word and copy it
            (*diccionarioDin)[i-1] = (char*) malloc(DIMF_C * sizeof(char));
            if ((*diccionarioDin)[i-1] == NULL) {
                // Handle memory allocation error
                printf("Error allocating memory for word.\n");
                return;
            }
            strcpy((*diccionarioDin)[i-1], palAct);
        }
        fclose(arch);
    }

    // Update the number of words
    *DIMF_F = i;
}
*/

int palabraExiste(char **dicc, int dimf_f, char palabra[]){
    int i, res = 0;
    for (i=0;i<dimf_f; i++)
        if(strcmp(palabra, dicc[i])){
            res = 1;
            break;
        }
    return res;
}

void recorrer(char** dicc, int dimf_f){
    char palabra[DIMF_C];
    printf("Ingrese una palabra (%s=FIN): ", FIN);
    scanf("%s", palabra);
    while (strcmp(palabra, FIN)){
        fflush(stdin);
        printf("La palabra %s", palabraExiste(dicc, dimf_f, palabra) ? "EXISTE" : "NO EXISTE");
        printf("Ingrese una palabra (%s=FIN): ", FIN);
        scanf("%s", palabra);
    }
}

void imprimirMatriz(char **dicc, int dimf_f){
    int i;
    for (i=0; i<dimf_f; i++)
        printf("%s", dicc[i]);
}
