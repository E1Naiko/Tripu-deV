#include <stdio.h>
#include <stdlib.h>
#define NUMARG 0
#define VERIFICAR(a) \
    if (a < 2) { \
        printf("Error de pasajes de parametros"); \
    }

#define CARGARNUM(b) \
    printf ("Escribir numero: "); \
    scanf("%d",&b)

#define PRINT_NUM(num) printf("Imprimir numero: %d\n",(num))

#include "Ejer3.h"
int main(int argc, char * argv[])
{
    VERIFICAR(argc);
    int a,b;

    #ifdef NUMARG
        a= atoi(argv[1]);
        b= atoi(argv[2]);
    #elif
        CARGARNUM(a);
        CARGARNUM(b);
    #endif // NUMARG
    PRINT_NUM(a);
    PRINT_NUM(b);
    char operador;
    operador = argv[3][0];
    printf("El operador es: %c",operador);
    float resul= Calculos(a,b,operador);
    printf("\nEl resultado es: %.2f",resul);
    return 0;
}
