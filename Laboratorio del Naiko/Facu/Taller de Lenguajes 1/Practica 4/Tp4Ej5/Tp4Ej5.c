/*
5.  Escriba un programa que reserve en forma dinámica un arreglo de 100 caracteres. A continuación, lea
    10 oraciones utilizando la función gets e informe para cada una de ellas la cantidad de letras
    minúsculas y de letras mayúsculas que la componen. Utilice el arreglo creado como variable temporal
    para procesar cada oración. Por último, libere la memoria reservada dinámicamente.
*/

#include <stdio.h>
#include <stdlib.h>

#define DIMF 101
#define CANT 10

char * reserva(int);
void contarCaracteresMayusMinus(const char * const , int *, int *);
void imprimirArreglo(char *);

int main()
{
    char * arreglo;
    int i,
        mayus,
        minus;

    arreglo = reserva(DIMF);

    for(i=0; i<CANT; i++){
        printf("Ingrese una oracion (de menos de %d caracteres): ", DIMF-1);
        gets(arreglo);
        imprimirArreglo(arreglo);
        contarCaracteresMayusMinus(arreglo, &mayus, &minus);
        printf("\nCantidad de caracteres mayusculas: %d, \n Cantidad de caracteres minusculas: %d.\n", mayus, minus);
    }

    free(arreglo);

    return 0;
}

char * reserva(int n){
    char * a;
    a = (char*) malloc(DIMF*sizeof(char));
    return a;
}

void contarCaracteresMayusMinus(const char * const a, int *mayus, int *minus){
    int i=0;
    *(mayus) = 0;
    *(minus) = 0;
    int aux =*a;
    while (aux != '\0' && i<DIMF){
        aux = ((int)*(a+i));
        if ('A'<= aux && aux<='Z')
            ++*(mayus);
        else if ('a'<= aux && aux<='z')
            ++*(minus);
        ++i;
    }
}

void imprimirArreglo(char *a){
    int i;
    printf("\n[");
    for(i=0; i<DIMF; i++){
        if (*(a+i) == '\0')
            break;
        printf("%c, ", *(a+i));
    }
    printf("]");
}
