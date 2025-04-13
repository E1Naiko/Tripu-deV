#include <stdio.h>
typedef struct jugador Jugador_T;
void CargarJugador(Jugador_T jugador)
{
    printf("Nombre y Apellido: ");
    scanf("%s",jugador.nomApe);
    printf("Edad: ");
    scanf("%d",&jugador.edad);
    printf("Cant Titulos: ");
    scanf("%d",&jugador.cantTitulo);
    printf("Ranking: ");
    scanf("%d",&jugador.ranking);
    printf("Fortuna: ");
    scanf("%f",&jugador.fortuna);
}

void CargarVector (Jugador_T jug[]);


