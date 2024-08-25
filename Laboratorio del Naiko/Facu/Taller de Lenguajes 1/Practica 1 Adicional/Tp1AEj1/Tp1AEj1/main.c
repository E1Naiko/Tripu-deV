/*
1. Escriba un programa que lea información relativa a la cantidad de especies de aves de 14 países
de América. De cada país se lee el código de país y la cantidad de especies. Informar los 2 países
con menor cantidad de especies. Además, se desea saber qué porcentaje de países tienen más de
40 especies.
*/
#include <stdio.h>
#include <stdlib.h>

#define INI_MENOR 9999
#define CANT_CODIGOS 14
#define MAYOR_QUE 40

void actualizarMenores(unsigned int , unsigned int *, unsigned int *);

int main()
{
    unsigned int codPaisAct, cantEspecies,
        menor1 = INI_MENOR, menor2 = INI_MENOR+1,
        cantCumple = 0;
    float porcentaje;
    int i;

    for (i=0; i<CANT_CODIGOS; i++){
        printf("Introduzca el codigo de Pais: ");
        scanf("%u", &codPaisAct);

        printf("- Introduzca la cantidad de especies: ");
        scanf("%u", &cantEspecies);

        if(cantEspecies>MAYOR_QUE)
            cantCumple++;
        actualizarMenores(cantEspecies, &menor1, &menor2);
    }
    porcentaje = (float)cantCumple*100/CANT_CODIGOS;
    printf("\nPorcentaje de especies pasando los %d especies %.2f por ciento.", (int) MAYOR_QUE, porcentaje);
    printf("\nMenor encontrado %u, sengundo menor encontrado %u", menor1, menor2);

    return 0;
}

void actualizarMenores(unsigned int valor, unsigned int *actMenor1, unsigned int *actMenor2){
    if(*actMenor2>valor){
        if (*actMenor1>valor){
            *actMenor2 = *actMenor1;
            *actMenor1 = valor;
        }
        else
            *actMenor2 = valor;
    }
}
