/*
    Un archivo csv (Comma Separated Values) contiene información separada por comas. Cada renglón
    (fila) contiene un registro de información. Cada columna contiene un campo particular de
    información. La primera fila es especial ya que contiene los nombres de los campos.

    Se desea obtener información a partir del archivo llamado vinos.csv (el cual se encuentra en la
    Sección “Ing. Gral. y Contenidos” del curso de la cátedra en WebUNLP). El programa debe generar
    un archivo de texto con un resumen que indique el valor máximo, mínimo y promedio para cada
    uno de los campos del archivo. Este archivo debe llamarse reporte_vinos.txt y debe guardarse en la
    misma ruta que el archivo vinos.csv.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define CANT_CAMPOS 8
#define TOPE 9999

typedef struct {
    float promedio,
          minimo,
          maximo;
    int cont;
} camposReporte;

enum campos{AcidezFija, AcidezVolatil, AcidoCitrico,
            AzucaresResiduales, PH, Sulfatos, Alcohol, Calidad};

int main()
{
    enum campos i;
    float aux;
    camposReporte repoAct [CANT_CAMPOS];
    char nombres [CANT_CAMPOS][20]= {"Acidez Fija","Acidez Volatil","Acido Citrico",
                        "Azucares Residuales","pH","Sulfatos",
                        "Alcohol","Calidad"},
         tipos[50],
         act;

    FILE* archivoVinos, * archReporte;
    archivoVinos = fopen("vinos.csv","r");
    if (archivoVinos){
        /* Inicializo los contadores de cada tipo, minimos y maximos*/
        for (i=AcidezFija; i<=Calidad; i++){
            repoAct[i].cont = 0;
            repoAct[i].promedio= 0;
            repoAct[i].maximo = -TOPE;
            repoAct[i].minimo = TOPE;
        }

        /* DESPEJO LA LINEA CON LOS NOMBRES Y CARACTERISTICAS*/
        fscanf(archivoVinos, "%c", &act);
        while (!feof(archivoVinos) && act!= '\n')
            fscanf(archivoVinos, "%c", &act);

        /* LEO LOS VALORES*/
        do{
            for (i=AcidezFija; i<=Calidad; i++){
                repoAct[i].cont +=1;
                fscanf(archivoVinos, "%f;", &aux);
                repoAct[i].promedio += aux;

                if (repoAct[i].maximo < aux)
                    repoAct[i].maximo = aux;

                if (repoAct[i].minimo > aux)
                    repoAct[i].minimo = aux;
            }

            /* Como cada linea termina con el tipo solo hace falta chequear el ultimo scan para ver si termina o no*/
            fscanf(archivoVinos, "%s;", tipos);
        }while (!feof(archivoVinos));

        for (i=AcidezFija; i<=Calidad; i++)
            repoAct[i].promedio = (float) repoAct[i].promedio / repoAct[i].cont;

        fclose(archivoVinos);
    }

    /* Imprimo Resultados */
    archReporte = fopen("reporte_vinos.txt","w");
    if (archReporte){
        fprintf(archReporte, "%-20s", "Atributo \t");
        for (i=AcidezFija; i<=Calidad; i++)
            fprintf(archReporte,"%-20s \t", nombres[i]);

        fprintf(archReporte, "%-20s", "\nPromedio\t");
        for (i=AcidezFija; i<=Calidad; i++)
            fprintf(archReporte,"%-20.2f \t", repoAct[i].promedio);

        fprintf(archReporte, "%-20s", "\nMínimo  \t");
        for (i=AcidezFija; i<=Calidad; i++)
            fprintf(archReporte,"%-20.2f \t", repoAct[i].minimo);

        fprintf(archReporte, "%-20s", "\nMáximo  \t");
        for (i=AcidezFija; i<=Calidad; i++)
            fprintf(archReporte,"%-20.2f \t", repoAct[i].maximo);

        fclose(archReporte);
    }
    return 0;
}
