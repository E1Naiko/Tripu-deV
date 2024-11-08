/*
    8. Realice un programa que genere un vector de 1000 enteros al azar y utilice una funci�n para localizar un
    elemento. Se pide:

    a) Implementar la funci�n de b�squeda que, dado un entero, retorne la posici�n donde se encuentra.
    En caso de no existir el n�mero retorne -1.

    b) Modificar a) para agregar informaci�n de depuraci�n que permita imprimir en consola la cantidad
    de veces que se debi� acceder al arreglo para encontrar (o no) el elemento en cada llamado a la
    funci�n. Utilice las directivas del procesador para activar/desactivar la depuraci�n e imprimir/no
    imprimir la informaci�n en la consola.

    c) Verifique el tama�o del programa compilando con la depuraci�n y sin la depuraci�n. Explique
    porque difieren
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DIMF 10
#define LIM_RANDOM 20
#define DEPURACION 0

void generarVector(int []);
int devolverPosicionEntero(int [], int);
void imprimirVector(int const[]);

int main(int argc, char *argv[])
{
    int vector[DIMF],
        buscar;

    #if (DEPURACION)
        printf("MODO DEPURACION ACTIVADO\n");
    #endif
    generarVector(vector);
    imprimirVector(vector);

    printf("Ingrese una entero a buscar: ");
    scanf("%d", &buscar);
    printf("Entero encontrado en la posicion %d\n", devolverPosicionEntero(vector, buscar));


    return 0;
}

void generarVector(int v[]){
    int i;
    for (i=0; i<DIMF; i++)
        v[i] = rand()%LIM_RANDOM;
}

int devolverPosicionEntero(int v[], int buscar){
    int res = -1,
        i;

    for (i=0; i<DIMF; i++){
        if (v[i]==buscar){
            res = i;
            break;
        }
    }

    #if (DEPURACION)
        printf("DEPURACION - Se accedio al vector %d veces\n", i+1);
    #endif
    return res;
}

void imprimirVector(int const v[]){
    if (DIMF>0){
        int i,
            tope = DIMF-1;
        printf("Vector = [");
        for (i=0; i<tope; i++)
            printf("%d,", v[i]);
        printf("%d",v[tope]);
        printf("]\n");
    }
}
