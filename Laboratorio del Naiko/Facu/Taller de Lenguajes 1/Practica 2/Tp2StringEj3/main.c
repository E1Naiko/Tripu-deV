/*
3. Escriba una función que reciba un puntero a una cadena de caracteres y dos caracteres individuales,
y que reemplace en la cadena todas las ocurrencias del primer carácter con el segundo. Además, la
función debe retornar la cadena. ¿Retornar la cadena tiene alguna utilidad o no tiene sentido?

RTA:
    NO porque, como un string es un arreglo de caracteres, cuando pasamos el inicio del arreglo como
parametro en realidad estamos pasando la referecia al arreglo completo con lo que lo midificaremos de todas formas
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define DIMF 50

void cargarString(char *str);
void intercambiarCaracteres(char *, char, char);

int main()
{
    char str[DIMF], a, b;

    cargarString(str);

    printf("Ingrese un valor A: ");
    scanf(" %c", &a);

    printf("\nIngrese un valor B: ");
    scanf(" %c", &b);

    printf("\n String Original:   %s", str);

    intercambiarCaracteres(str, a, b);

    printf("\n String Modificado: %s", str);

    return 0;
}

void cargarString(char *str){
    int i;

    srand(time(NULL));
    for (i=0; i<DIMF; i++){
        *(str+i) = rand()%('z'-'a') + 'a';
    }
    *(str+DIMF-1)= '\0';
}

void intercambiarCaracteres(char *str, char a, char b){
    int i;

    for(i=0; i<DIMF; i++){
        if (*(str+i) == a)
            *(str+i) = b;
    }
}
