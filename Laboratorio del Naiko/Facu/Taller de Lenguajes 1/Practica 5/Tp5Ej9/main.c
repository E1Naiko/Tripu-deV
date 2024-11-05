/*
    9) Escriba un programa que lea información de 20 jugadores de tenis. De cada jugador se lee nombre y
    apellido, edad, cantidad de títulos, ranking actual y fortuna acumulada. Defina una estructura de
    datos adecuada para la información y almacene la misma en un archivo binario. Finalizada la
    lectura, procese los datos almacenados en el archivo e informe:

    a) Nombre y apellido del jugador con mejor ranking.
    b) Nombre y apellido del jugador que más títulos ha ganado.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DIMF 50
#define NOMBRE_ARCHIVO "datosJugadores.dat"
#define TIPO_LECTURA "wb+"
#define PEOR_RANKING 200
#define PEOR_CANT_TITULOS 0

#define FIN "FIN"

#define ERROR_MSJ_FOPEN(x) (printf("ERROR - " #x " no se abrio correctamente")) // PREGUNTAR

/* C/ jugador
    nombre y apellido, edad, cantidad de títulos, ranking actual y fortuna acumulada
*/
typedef struct {
    char nombre[DIMF],
        apellido[DIMF];
    unsigned char edad,
        cantTitulos,
        rankingAct;
    float fortunaAcumulada;
} Tjugador;

Tjugador leerJugador();
void copiarEstructura(Tjugador *destino, Tjugador origen);

int main()
{
    FILE * archDatosJugadores;

    archDatosJugadores = fopen(NOMBRE_ARCHIVO, TIPO_LECTURA);
    if (!archDatosJugadores){
        ERROR_MSJ_FOPEN(NOMBRE_ARCHIVO);
        return -1;
    }

    // ------------------- PRIMER PARTE DEL PROGRAMA -------------------

    Tjugador jugadorAct;

    jugadorAct = leerJugador();
    while (strcmp(jugadorAct.nombre, FIN)){
        fwrite(&jugadorAct, sizeof(Tjugador), 1, archDatosJugadores);
        jugadorAct = leerJugador();
    }

    // ------------------- SEGUNDA PARTE DEL PROGRAMA -------------------

    Tjugador jugadorLectura,
            jugadorMejorRanking,
            jugadorMasTitulosGanados;

    strcpy(jugadorMejorRanking.nombre, "ERROR");
    strcpy(jugadorMejorRanking.apellido, "ERROR");
    jugadorMejorRanking.rankingAct = PEOR_RANKING;

    strcpy(jugadorMasTitulosGanados.nombre, "ERROR");
    strcpy(jugadorMasTitulosGanados.apellido, "ERROR");
    jugadorMasTitulosGanados.cantTitulos = PEOR_CANT_TITULOS;

    fseek(archDatosJugadores, 0, SEEK_SET);

    fread(&jugadorLectura, sizeof(Tjugador), 1, archDatosJugadores);
    while (!feof(archDatosJugadores)){
        if (jugadorLectura.rankingAct < jugadorMejorRanking.rankingAct)
            copiarEstructura(&jugadorMejorRanking, jugadorLectura);
        if (jugadorLectura.cantTitulos > jugadorMasTitulosGanados.cantTitulos)
            copiarEstructura(&jugadorMasTitulosGanados, jugadorLectura);

        fread(&jugadorLectura, sizeof(Tjugador), 1, archDatosJugadores);
    }

    printf("\n---------------------------------------------\n");
    printf("Jugador con mejor ranking: %s, %s\n", jugadorMejorRanking.nombre, jugadorMejorRanking.apellido);
    printf("Jugador con mas titulos ganados: %s, %s\n", jugadorMasTitulosGanados.nombre, jugadorMasTitulosGanados.apellido);

    fclose(archDatosJugadores);
    return 0;
}

Tjugador leerJugador(){
    Tjugador act;
    printf("Introduzca un nombre (FIN = %s): ", FIN);
    scanf("%s", act.nombre);
    if (strcmp(act.nombre, FIN)){
        printf(" - Introduzca el apellido del jugador: ");
        scanf("%s", act.apellido);
        printf(" - Introduzca la edad del jugador edad: ");
        scanf("%u", &act.edad);
        printf(" - Introduzca la cantidad de titulos ganados por el jugador: ");
        scanf("%u", &act.cantTitulos);
        printf(" - Introduzca el ranking actual del jugador: ");
        scanf("%u", &act.rankingAct);
        printf(" - Introduzca la fortuna acumulada por el jugador: ");
        scanf("%f", &act.fortunaAcumulada);
    }
    return act;
}

void copiarEstructura(Tjugador *destino, Tjugador origen){
    strcpy(destino->nombre, origen.nombre);
    strcpy(destino->apellido, origen.apellido);
    destino->cantTitulos = origen.cantTitulos;
    destino->edad = origen.edad;
    destino->fortunaAcumulada = origen.fortunaAcumulada;
    destino->rankingAct = origen.rankingAct;
}
