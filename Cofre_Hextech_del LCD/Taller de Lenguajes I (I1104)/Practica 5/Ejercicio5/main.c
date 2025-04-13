#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define N 100
void cargarDiccionario(FILE *,char ***,int*);
char ** cargarMatriz(FILE *,int *);
void imprimirEnConsola(FILE *);
int buscarpalabra(char**, int, const char*);
void recorrerDiccionario(char **, int);
int main()
{   FILE *arch;
    char **diccionario;
    char palabra[N];
    int cant=0;
    arch = fopen("diccionario.txt", "r");
    imprimirEnConsola(arch);
    printf("\n");
    diccionario = NULL;
        if (arch) {
        cargarDiccionario(arch,&diccionario,&cant);
        //diccionario= cargarMatriz(arch,&cant);
        printf("Recorrer diccionario: \n");
        recorrerDiccionario(diccionario,cant);
        printf("Escribir palabra: \n");
        scanf("%s",palabra);
        while (strcmp(palabra,"zzz")) {
            if (buscarpalabra(diccionario,cant,palabra)){
                printf ("La palabra %s esta en el diccionario",palabra);
            } else {
                printf ("La palabra %s no esta en el diccionario",palabra);
            }
            printf("\nEscribir otra palabra: \n");
            scanf("%s",palabra);
        }
        fclose(arch);
        } else {
            printf("No se pudo abrir el archivo");
        return 1;
    }
    return 0;
}

void cargarDiccionario(FILE * arch, char*** diccionario, int* cantidadPalabras) {
    char palabra[N];
    int i = 0;
    /* fscanf(arch,"%s",palabra);
    while (!feof(arch)) {
        *diccionario = realloc(*diccionario, (i + 1)*sizeof(char*));
        (*diccionario)[i] = malloc((strlen(palabra) + 1) * sizeof(char));
        strcpy((*diccionario)[i], palabra);
        i++;
        fscanf(arch,"%s",palabra);
    } */
    while (fscanf(arch, "%s", palabra) == 1) {
        *diccionario = realloc(*diccionario, (i + 1) * sizeof(char *));
        (*diccionario)[i] = malloc((strlen(palabra) + 1) * sizeof(char));
        strcpy((*diccionario)[i], palabra);
        i++;
    }
    *cantidadPalabras = i;
}

/*char ** cargarMatriz(FILE * arch,int *cant){
    char **diccionario = NULL;
    char palabra[N];
    int i = 0;
    fscanf(arch,"%s",palabra);
    do {
        diccionario = realloc(diccionario, (i + 1) * sizeof(char*));
        diccionario[i] = (char*) malloc((strlen(palabra) + 1) *sizeof(char));
        strcpy(diccionario[i], palabra);
        i++;
        fscanf(arch,"%s",palabra);
    while (!feof(arch));
    *cant = i;
    return diccionario;
}*/

int buscarpalabra(char** diccionario, int cantPalabras, const char* palabra)
{ int i=0;
    int aux;
    for (i = 0; i < cantPalabras; i++) {
        if (strcmp(diccionario[i], palabra)==0) {
            aux = 1;
        }
    }
    aux = 0;
    return aux;
}
void recorrerDiccionario(char** diccionario, int cantPalabras)
{   int i;
    for (i = 0; i < cantPalabras; i++) {
        printf("%s",(diccionario[i]));
    }
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
