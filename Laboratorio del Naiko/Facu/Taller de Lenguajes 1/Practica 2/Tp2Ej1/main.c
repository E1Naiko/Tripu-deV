/*
1. Escriba un programa que genere 50 números enteros en forma pseudoaleatoria y que los almacene en
un arreglo unidimensional. Luego de realizada la carga, informar la cantidad de números pares que
se encuentran en posiciones impares del arreglo y también la cantidad de números impares que se
encuentran en posiciones pares.
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define DIMF 50

void cargarArreglo(int []);
void recorrerArregloEInformar(int[]);
void imprimirArreglo(int []);

int main(){
    int arregloEnteros[DIMF];

    cargarArreglo(arregloEnteros);

    imprimirArreglo(arregloEnteros);

    recorrerArregloEInformar(arregloEnteros);

    return 0;
}

void cargarArreglo(int A[]){
    int i;
    srand(time(NULL));

    for(i=0; i<DIMF; i++){
        A[i] = rand()%20;
    }
}

void recorrerArregloEInformar(int A[]){
    int i, cantCondicion1 = 0, cantCondicion2 = 0;

    for(i=0; i<DIMF; i++){
        /*Condicion 1: números pares que se encuentran en posiciones impares*/
        if (i%2){
            if (!(A[i]%2)){
                cantCondicion1++;
            }
        }
        /*Condicion 2: números impares que se encuentran en posiciones pares*/
        else{
            if (A[i]%2){
                cantCondicion2++;
            }
        }
    }
    printf("\nCantidad de números pares que se encuentran en posiciones impares del arreglo: %d", cantCondicion1);
    printf("\nCantidad de números impares que se encuentran en posiciones pares: %d", cantCondicion2);
    }

void imprimirArreglo(int A[]){
    int i;
    printf("\nDEBUG - Arreglo: [");
    printf("%d", A[0]);
    for(i=1; i<DIMF; i++)
        printf(",%d", A[i]);
    printf("]");
}
