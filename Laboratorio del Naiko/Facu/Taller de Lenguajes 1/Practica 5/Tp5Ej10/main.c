/*
    10) Utilizando el archivo binario generado en el ejercicio anterior:

    a) escriba una función que permita actualizar el ranking de un jugador. Dicha función recibe como
    parámetros nombre, apellido y nuevo ranking del jugador y retorna 1 si pudo realizar la
    modificación y 0 en caso contrario.

    b) escriba un programa que lea desde teclado el nombre y apellido de jugadores y sus nuevos
    rankings hasta ingresar "ZZZ" y actualice el ranking de cada jugador o muestre un mensaje de
    error en caso de no existir el jugador. Por último, imprima el contenido del archivo modificado,
    para verificar que la actualización se haya aplicado correctamente.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DIMF 50
#define NOMBRE_ARCHIVO "datosJugadores.dat"
#define TIPO_LECTURA "rb"
#define FIN "ZZZ"

#define ERROR_MSJ_FOPEN(x) (printf("ERROR - " #x " no se abrio correctamente")) // PREGUNTAR
#define ERROR_MSJ_NOTFOUND (printf("\n\nERROR - Jugador no encontrado\n"))

typedef struct {
    char nombre[DIMF],
        apellido[DIMF];
    unsigned char edad,
        cantTitulos,
        rankingAct;
    float fortunaAcumulada;
} Tjugador;

void imprimirJugador(Tjugador);
void imprimirDatos(FILE*);
int modificarDatos(char [], char [], char, FILE*);

int main()
{
    FILE * archDatosJugadores;
    char nombre[DIMF],
        apellido[DIMF];
    char ranking;

    archDatosJugadores = fopen(NOMBRE_ARCHIVO, TIPO_LECTURA);
    if (!archDatosJugadores){
        ERROR_MSJ_FOPEN(NOMBRE_ARCHIVO);
        return -1;
    }

    imprimirDatos(archDatosJugadores);

    printf("\n\nIngrese un nombre (FIN = %s): ", FIN);
    scanf("%s", nombre);
    while (strcmp(nombre, FIN)){
        printf(" - Ingrese un apellido: ");
        scanf("%s", apellido);
        printf(" - Ingrese un ranking: ");
        scanf("%u", &ranking);
        if (modificarDatos(nombre, apellido, ranking, archDatosJugadores))
            printf("\n Jugador %s, %s modificado con éxito.", nombre, apellido);
        else
            ERROR_MSJ_NOTFOUND;
        printf("\nIngrese un nombre (FIN = %s): ", FIN);
        scanf("%s", nombre);
    }

    imprimirDatos(archDatosJugadores);

    printf("\nFIN.");
    fclose(archDatosJugadores);
    return 0;
}

void imprimirJugador(Tjugador jugador) {
    printf("Nombre: %s\n", jugador.nombre);
    printf(" - Apellido: %s\n", jugador.apellido);
    printf(" - Edad: %u\n", jugador.edad);
    printf(" - Cantidad de Titulos: %u\n", jugador.cantTitulos);
    printf(" - Ranking Actual: %u\n", jugador.rankingAct);
    printf(" - Fortuna Acumulada: %.2f\n", jugador.fortunaAcumulada);
}

void imprimirDatos(FILE* archDatosJugadores){ // MODIFICA EL PUNTERO INDICE ACTUAL Y LO DEVUELVE A INICIO
    if (archDatosJugadores){
        Tjugador jugadorAct;
        fseek(archDatosJugadores, 0, SEEK_SET);

        printf("\n\n IMPRIMIENDO JUGADORES:\n");
        fread(&jugadorAct, sizeof(Tjugador), 1, archDatosJugadores);
        while (!feof(archDatosJugadores)){
            imprimirJugador(jugadorAct);
            fread(&jugadorAct, sizeof(Tjugador), 1, archDatosJugadores);
        }

        fseek(archDatosJugadores, 0, SEEK_SET);
    }
}

int modificarDatos(char nombre[], char apellido[], char rankingNuevo, FILE* archDatosJugadores){
    // Voy a guardar la cantidad de datos que tiene el archivo para poder moverme dentro de el
    static int inicialice = 1;
    if (inicialice){
        int cantBytes;
        fseek(archDatosJugadores, 0, SEEK_END);
        cantBytes = ftell(archDatosJugadores);
        static int diml_Arch;
        diml_Arch = cantBytes / sizeof(Tjugador);
        inicialice--;
    }

    int res = 0,
        posicion = 0;
    if (archDatosJugadores){
        Tjugador jugadorAct;
        void *aux;

        fseek(archDatosJugadores,0,SEEK_SET);
        fread(&jugadorAct, sizeof(Tjugador), 1, archDatosJugadores);
        while (!feof(archDatosJugadores)){
            posicion++;
            if (!(strcmp(nombre, jugadorAct.nombre) && strcmp(apellido, jugadorAct.apellido))){
                res = 1;
                printf("\nDEBUG - POSICION DEL JUGADOR ENCONTRADA EN P=%d", posicion);
                fseek(archDatosJugadores,posicion*sizeof(Tjugador), SEEK_SET);
                fread(&aux, DIMF*sizeof(char),2,archDatosJugadores);
                fread(&aux, sizeof(unsigned char),2,archDatosJugadores);
                fread(&aux, sizeof(unsigned char),1,archDatosJugadores);
                printf("\n%u", aux);
                break;
            }
            fread(&jugadorAct, sizeof(Tjugador), 1, archDatosJugadores);
        }
        fseek(archDatosJugadores,0,SEEK_SET);
    }
    return res;
}
