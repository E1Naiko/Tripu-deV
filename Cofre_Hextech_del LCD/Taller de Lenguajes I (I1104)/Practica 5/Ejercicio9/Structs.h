#ifndef STRUCTS_H_INCLUDED
#define STRUCTS_H_INCLUDED

#define MAX_L 50
struct jugador {
    char nomApe [MAX_L];
    int edad;
    int cantTitulo;
    int ranking;
    float fortuna;
};

void CargarJugador (struct);


#endif // STRUCTS_H_INCLUDED
