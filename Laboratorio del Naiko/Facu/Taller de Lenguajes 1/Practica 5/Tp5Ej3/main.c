/*
3)  Se desea leer y procesar información de precipitaciones del mes de enero. Para ello se dispone de un
    archivo de texto (llamado precipitaciones.txt) con el siguiente formato:
    0-2-0-0-7-22-11-0- . . . -0-

    Por cada de los 31 días se tiene un número entero indicando los milímetros llovidos, seguido de un
    guión medio (-) como delimitador. Escriba un programa que lea la información del archivo y
    derermine el día con mayor precipitación. Para evaluar el programa, genere un archivo con el
    formato establecido utilizando un editor de texto plano (por ejemplo: Bloc de notas o Notepad++).

    Nota: puede utilizar la función fscanf para procesar cada valor de precipitación.

*/

#include <stdio.h>
#include <stdlib.h>

void imprimirEnConsola(FILE * archivoTXT);

int main()
{
    FILE * arch;
    arch = fopen("precipitaciones.txt", "r");
    unsigned int diaAct = 0,
                 diaMax = 0,
                 precipitacionAct,
                 precipitacionMax = 0;


    if (arch){
        printf("archivo abierto\n");

        fscanf(arch, "%u-", &precipitacionAct);
        while (!feof(arch)){
            diaAct++;
            if (precipitacionMax<precipitacionAct){
                diaMax = diaAct;
                precipitacionMax = precipitacionAct;
            }
            fscanf(arch, "%u-", &precipitacionAct);
        }

        fclose(arch);
    }
    else printf("el archivo no existe\n");

    if (diaMax)
            printf("Dia de maxima precipitacion %u de enero con %umm", diaMax, precipitacionMax);
        else
            printf("ERROR");

    return 0;
}
