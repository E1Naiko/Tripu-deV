/*
    8) Escriba un programa que lea desde teclado números enteros de una cifra (del 0 al 9) y que cree dos
    archivos, los cuales almacenen los números leídos. El primer archivo debe llamarse “numeros.txt” y
    contener en formato texto todos los números leídos en forma consecutiva. El segundo archivo debe
    llamarse “numeros.dat” y contener todos los números leídos en formato binario.

    ▪ Una vez ejecutado el programa, utilice un editor de texto (como por ejemplo: el Bloc de notas
    en MS Windows, o Gedit en GNU/Linux) para abrir el archivo de texto y corroborar que la
    información almacenada sea la correcta. Usando el mismo editor, intente abrir el archivo
    binario. ¿Es posible visualizar los números? ¿Por qué cree que no es posible?

    ▪ Compare los tamaños que ocupan cada archivo. ¿Cuál es más grande? ¿En qué ocasiones
    cree usted que sería mejor utilizar cada tipo de archivos?

    NO CREA EL ARCHIVO DAT CORRECTAMENTE
*/

#include <stdio.h>
#include <stdlib.h>
#include "Convertidor.h"

#define ERROR_MSJ_FOPEN(x) (printf("ERROR - " #x " no se abrio correctamente")) // PREGUNTAR:
// como reemplaza directamente en el preprocesador si le paso una constante definida me va a
// pasar el nombre de la constante y no el valor definido en la constante
#define ERROR_MSJ_LECTURA(Y) (printf("ERROR - %d excede el rango", (Y))) // PREGUNTAR

#define NOMBRE_ARCHIVO1 "numeros.txt"
#define NOMBRE_ARCHIVO2 "numeros.dat"

#define INT_INF 0
#define INT_SUP 9
#define FIN -1

int main()
{
    FILE * archNumeroTXT,
         * archNumeroBIN;

    printf("3 en binario sin signo = %d\n", convertirDecimalBSS(3));
    archNumeroTXT = fopen(NOMBRE_ARCHIVO1, "w");
    if (!archNumeroTXT){
        ERROR_MSJ_FOPEN(NOMBRE_ARCHIVO1);
        return -1;
    }

    archNumeroBIN = fopen(NOMBRE_ARCHIVO2, "wb");
    if (!archNumeroBIN){
        ERROR_MSJ_FOPEN(NOMBRE_ARCHIVO2);
        fclose(archNumeroBIN);
        return -2;
    }

    int act;
    printf("Introduzca un entero (FIN=-1): ");
    scanf("%d", &act);
    while (act!=FIN){
        if (act>=INT_INF && act<=INT_SUP){
            fprintf(archNumeroTXT, " %d", act);
            fwrite(&act,sizeof(int),1,archNumeroBIN);
        }
        else
            ERROR_MSJ_LECTURA(act);
        printf("\nIntroduzca un entero (FIN=-1): ");
        scanf("%d", &act);
    }
    return 0;
}
