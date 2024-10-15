/*
11. Se requiere la implementación de un tipo de datos para almacenar el horario de manera compacta
utilizando 16 bits. Debido a que el tamaño de los datos es más importante que la precisión, puede
admitirse pérdida de precisión en los segundos. Desarrolle un programa que implemente este tipo de
datos y funciones para leer la hora por teclado e imprimirla por pantalla.
*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define MAX_BIT_HH 5
#define MAX_BIT_MM 6
#define MAX_BIT_SS 5

typedef struct horario{
    unsigned char hh:MAX_BIT_HH,
        mm:MAX_BIT_MM,
        ss:MAX_BIT_SS;
} horario_t;

horario_t leerHorario();
void imprimirHorario(horario_t);

int main()
{
    horario_t tiempo;
    tiempo = leerHorario();

    imprimirHorario(tiempo);
    return 0;
}

horario_t leerHorario(){
    horario_t h;
    unsigned int hh,
        mm,
        ss;

    printf("\nIntroduzca la cantidad de horas: ");
    scanf("%u", &hh);
    while (hh<00 || hh>23 ){
        printf("\nERROR - CAPACIDAD EXCEDIDA \nIntroduzca la cantidad de horas: ");
        scanf("%u", &hh);
    }

    printf("\nIntroduzca la cantidad de minutos: ");
    scanf("%u", &mm);
    while (mm<00 || mm>60){
        printf("\nERROR - CAPACIDAD EXCEDIDA \nIntroduzca la cantidad de minutos: ");
        scanf("%u", &mm);
    }

    printf("\nIntroduzca la cantidad de segundos: ");
    scanf("%u", &ss);
    while (ss<00 || ss>32){
        printf("\nERROR - CAPACIDAD EXCEDIDA \nIntroduzca la cantidad de segundos: ");
        scanf("%u", &ss);
    }

    h.hh = hh;
    h.mm = mm;
    h.ss = ss;

    return h;
}

void imprimirHorario(horario_t h){
    unsigned int hh = h.hh,
        mm = h.mm,
        ss = h.ss;
    printf("\nHorario: %u:%u:%u", hh ,mm, ss);
}

