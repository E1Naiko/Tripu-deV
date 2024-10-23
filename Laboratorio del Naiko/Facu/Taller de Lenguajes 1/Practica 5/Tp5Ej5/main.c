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

void cargarMatriz(FILE *, char ***, int *);
int palabraExiste(char **, int , char []);
void recorrer(char**, int);
void imprimirMatriz(char **, int );

int main()
{
    int dimf_f = 0;
    FILE * arch;
    arch = fopen("pruebatp5.txt", "r");
    char **diccionarioDin;
    if(arch){
        printf("APERTURA\n");

        diccionarioDin = (char**) malloc(sizeof(char*));

        cargarMatriz(arch, &diccionarioDin, &dimf_f);

        imprimirMatriz(diccionarioDin, dimf_f);

        recorrer(diccionarioDin, dimf_f);

        fclose(arch);
    }else{
        printf("ERROR APERTURA\n");
    }

    return 0;
}

void cargarMatriz(FILE * arch, char * ** diccionarioDin, int * DIMF_F){
    // USO UN PUNTERO TRIPLE PORQUE ESTOY PASANDO POR REFERENCIA UN PUNTERO DOBLE
    char palAct[DIMF_C];
    int i = *DIMF_F;
    if (arch){
        do{
            fscanf(arch, "%s", palAct);
            i++;

            *diccionarioDin = realloc(*diccionarioDin, (i+DIMF_C)*sizeof(char*));
            (*diccionarioDin)[i] = (char*) malloc(DIMF_C*sizeof(char));
            strcpy((*diccionarioDin)[i], palAct);
        }while (!feof(arch));
        i++;
    }
    *(DIMF_F) = i;
}

int palabraExiste(char **dicc, int dimf_f, char palabra[]){
    int i, res = 0;
    for (i=0;i<dimf_f; i++){
        if(!strcmp(palabra, dicc[i])){
            printf("\nPalabra %s = %s", palabra, dicc[i]);
            res = 1;
            break;
        }
        printf("\nPalabra %s != %s", palabra, dicc[i]);
    }
    return res;
}

void recorrer(char** dicc, int dimf_f){
    char palabra[DIMF_C];
    printf("Ingrese una palabra (%s=FIN): ", FIN);
    scanf("%s", palabra);
    while (strcmp(palabra, FIN)){
        fflush(stdin);
        printf("\nLa palabra %s", palabraExiste(dicc, dimf_f, palabra) ? "EXISTE" : "NO EXISTE");
        printf("\nIngrese una palabra (%s=FIN): ", FIN);
        scanf("%s", palabra);
    }
}

void imprimirMatriz(char **dicc, int dimf_f){
    int i;
    printf("\n");
    for (i=0; i<dimf_f; i++)
        printf("%s, ", dicc[i]);
    printf("\n");
}
