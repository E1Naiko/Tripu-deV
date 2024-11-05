/*
    8. Realice un programa que genere un vector de 1000 enteros al azar y utilice una función para localizar un
    elemento. Se pide:

    a) Implementar la función de búsqueda que, dado un entero, retorne la posición donde se encuentra.
    En caso de no existir el número retorne -1.

    b) Modificar a) para agregar información de depuración que permita imprimir en consola la cantidad
    de veces que se debió acceder al arreglo para encontrar (o no) el elemento en cada llamado a la
    función. Utilice las directivas del procesador para activar/desactivar la depuración e imprimir/no
    imprimir la información en la consola.

    c) Verifique el tamaño del programa compilando con la depuración y sin la depuración. Explique
    porque difieren
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DIMF 10
#define LIM_RANDOM 20
#define CLAVE_DEPURACION "ACT_DEPURACION"

void generarVector(int []);
int verificarModoDepuracion(int argc, char * argv[]);
int devolverPosicionEntero(int [], int, int);
void imprimirVector(int const[]);

int main(int argc, char *argv[])
{
    int vector[DIMF],
        buscar,
        modoDepuracion = verificarModoDepuracion(argc, argv);

    if (!modoDepuracion)
        printf("MODO DEPURACION ACTIVADO\n");
    generarVector(vector);
    imprimirVector(vector);

    printf("Ingrese una entero a buscar: ");
    scanf("%d", &buscar);
    printf("Entero encontrado en la posicion %d\n", devolverPosicionEntero(vector, buscar, modoDepuracion));


    return 0;
}

void generarVector(int v[]){
    int i;
    for (i=0; i<DIMF; i++)
        v[i] = rand()%LIM_RANDOM;
}

int verificarModoDepuracion(int argc, char * argv[]){
    int res = 1,
        i;

    for (i=0; i<argc; i++){
        if (!strcmp(argv[i], CLAVE_DEPURACION)){
            res = 0;
            break;
        }
    }

    return res;
}

int devolverPosicionEntero(int v[], int buscar, int depurar){
    int res = -1,
        i;

    for (i=0; i<DIMF; i++){
        if (v[i]==buscar){
            res = i;
            break;
        }
    }

    if (!depurar)
        printf("DEPURACION - Se accedio al vector %d veces\n", i+1);

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
