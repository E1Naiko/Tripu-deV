#include <stdio.h>
#include <stdlib.h>
#include "Funciones.h"
#define T 10
#define MAX_L 1024
#define DEBUG_PRINTF(msg) printf("%s\n",msg)

int main()
{ FILE* arch; FILE* arch2;
  char linea[MAX_L], *campos[T],delimitador;
  int c = 8, f = 0, cant;
  float max[T], min[T], tot[T],valor,prom;
    arch = fopen("vinos_prueba.csv","r");
    if (arch) {
            DEBUG_PRINTF("Se abrio el archivo vinos_prueba.csv\n");
    } else {
        DEBUG_PRINTF("No se abrio el archuvo\n");
        return -1;
    }
    arch2 = fopen ("reporte_vinos.txt","w");
    if (arch2){
        DEBUG_PRINTF("Se abrio el archivo reporte_vinos.txt \n");
    } else {
        DEBUG_PRINTF("No se abrio el archivo reportes_vinos.txt");
        fclose(arch);
        return -2;
    }
    //fscanf(arch,"%s;",linea);
    fgets(linea,MAX_L,arch);
    printf("\t%s",linea);
    inicializarVectores(max,min,tot,c);
    DEBUG_PRINTF("\n");
    DEBUG_PRINTF("Vectores Inicializado\n");
    DEBUG_PRINTF("--------------------------- \n");
    recorrerVectores(max,min,tot,c);
    fscanf(arch,"%f;",&valor);
    printf("%f",valor);
    while (!feof(arch)) {
        for (f = 0; f < c; f++) {
            if (valor > max[f]) {
                max[f] = valor;
            }
            if (valor < min[f]) {
                min[f] = valor;
            }
            tot[f] += valor;
            fscanf(arch,"%f;",&valor);
        }
    }
    DEBUG_PRINTF("\n\nVectores Cargados\n");
    DEBUG_PRINTF("--------------------------- \n");
    recorrerVectores(max,min,tot,c);
    fprintf(arch2, "Resumen de los datos del archivo reporte_vinos-txt \n");
    for (cant = 0; cant < c; cant++) {
        prom = tot[cant] / c;
        fprintf(arch2, "Campo: %c\n", linea);
        fprintf(arch2, "Máximo: %.2f\n", max[cant]);
        fprintf(arch2, "Mínimo: %.2f\n", min[cant]);
        fprintf(arch2, "Promedio: %.2f\n\n", prom);
    }
    fclose(arch);
    fclose(arch2);
    return 0;
}
