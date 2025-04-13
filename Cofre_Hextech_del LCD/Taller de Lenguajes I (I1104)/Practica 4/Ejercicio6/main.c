#include <stdio.h>
#include <stdlib.h>
#include "Funciones.h"

#define PRINT(m) printf("%s\n",m)

#define T "-----------------"

#define LEER_NUMEROS(a) \
    printf ("Leer Numero: "); \
    scanf("%d",&(a)); \

int main(){
    Lista L,L2;
    int n,n2;
    Inicializar(&L);
    LEER_NUMEROS(n);
    while (n != 0){
        AgregarFinal(&L,n);
        AgregarAdelante(&L2,n);
        LEER_NUMEROS(n);
    }
    printf("Lista Generada \n");
    //printf("---------------------\n");
    PRINT(T);
    Imprimir (&L);
    PRINT("\n");
    PRINT(T);
    Recorrer(&L);
    printf("Lista 2 Generada \n");
    printf("---------------------\n");
    Imprimir (&L2);
    printf("\n");
    PRINT(T);
    Recorrer(&L2);
//    printf("\nLeer Numero que su multiplo sera eliminado de la lista: \n");
//    LEER_NUMEROS(n2);
//    PRINT("Lista 1");
//    Multiplos(&L,n2);
//    Imprimir (&L);
//    printf("Lista 2 \n");
//    Multiplos(&L2,n2);
//    Imprimir (&L2);
    printf("\nLeer Numero para insertar: \n");
    LEER_NUMEROS(n2);
    InsertarOrdenado(&L,n2);
    Imprimir(&L);
    Eliminar(&L);
    Eliminar(&L2);
    return 0;
}
