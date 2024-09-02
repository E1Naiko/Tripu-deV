/*
Se dispone de un arreglo con información de las precipitaciones de todos los días de todos los meses
de los últimos 10 años. Se desea conocer para cada año el mes en que menos llovió y también cual es
el año que tuvo menor precipitación promedio.

Nota: por simplicidad asuma que todos los meses tienen 30 días.
*/

#include <stdio.h>
#include <stdlib.h>
#include <FLOAT.H>
#include <time.h>

#define DIMF_D 5
#define DIMF_M 12
#define DIMF_A 10
#define REDONDEO1 10000
#define REDONDEO2 25

void cargarArreglo(float [][DIMF_M][DIMF_A]);
void imprimirArreglo(const float [][DIMF_M][DIMF_A]);
void recorrerArreglo(const float [][DIMF_M][DIMF_A],  int [], float *);

int main()
{
    int i;
    float menorPrecipitacionPromedio=0;

    float arregloPreCargado [DIMF_D][DIMF_M][DIMF_A];
    int arregloMeses[DIMF_A];

    cargarArreglo(arregloPreCargado);
    imprimirArreglo(arregloPreCargado);

    recorrerArreglo(arregloPreCargado, arregloMeses, &menorPrecipitacionPromedio);

    printf("\n\nMenor Precipitacion promedio: %.2f", menorPrecipitacionPromedio);
    for (i=0; i<DIMF_A; i++){
        printf("\nMes con Menor precipitacion del año %d: %d", i+2014, arregloMeses[i]);
    }

    return 0;
}

void cargarArreglo(float A[][DIMF_M][DIMF_A]){
    int i, j, k;
    srand(time(NULL));

    for (k=0; k<DIMF_A; k++){
        for(j=0; j<DIMF_M; j++){
            for(i=0; i<DIMF_D; i++){
                A[i][j][k]= (float) (rand()%REDONDEO1)/ (rand()%REDONDEO2+2);
            }
        }
    }
}

void imprimirArreglo(const float A[][DIMF_M][DIMF_A]){
    int i, j, k;

    for (k=0; k<DIMF_A; k++){
        for(j=0; j<DIMF_M; j++){
            printf("\n%d/%d - [%.2f", (j+1), (k+2014), A[0][j][k]);

            for(i=1; i<DIMF_D; i++){
                printf("|%f", A[i][j][k]);
            }
            printf("]");
        }
        printf("\n");
    }
}

void recorrerArreglo(const float arregloOriginal[][DIMF_M][DIMF_A],  int arregloMeses[], float *menorPromedio){
    int i, j, k,
        mesMenorPrecipitacion;;

    float menorPromAct = FLT_MAX,
        sumatoriaPrecipitacionAnual,
        promAct,
        sumatoriaPrecipitacionMensual,
        menorPrecipitacionMensual;

    for (k=0; k<DIMF_A; k++){
        sumatoriaPrecipitacionAnual = 0;
        menorPrecipitacionMensual = FLT_MAX;
        mesMenorPrecipitacion = 12;

        for(j=0; j<DIMF_M; j++){
            sumatoriaPrecipitacionMensual = 0;
            for(i=0; i<DIMF_D; i++){
                sumatoriaPrecipitacionMensual += arregloOriginal[i][j][k];
            }
            sumatoriaPrecipitacionAnual += sumatoriaPrecipitacionMensual;
            if (sumatoriaPrecipitacionMensual<menorPrecipitacionMensual){
                menorPrecipitacionMensual = sumatoriaPrecipitacionMensual;
                mesMenorPrecipitacion = j;
            }
        }

        promAct = (float) sumatoriaPrecipitacionAnual / (DIMF_D*DIMF_M);
        printf("\n Promedio: %f", promAct);
        if (promAct < menorPromAct)
            menorPromAct = promAct;
        arregloMeses[k] = mesMenorPrecipitacion;
    }

    *menorPromedio = menorPromAct;
}
