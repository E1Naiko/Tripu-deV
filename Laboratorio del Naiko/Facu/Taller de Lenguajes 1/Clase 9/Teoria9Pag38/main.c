/*
 Escriba un programa C que compare el contenido de dos archivos de texto denominados
 "Lectura1.txt" y "Lectura2.txt".

• Si no son iguales, el programa deberá imprimir la ubicación del primer carácter diferente (número
  de línea y número de carácter dentro de la línea).

*/

#include <stdio.h>
#include <stdlib.h>

int main()
{
    char dirLect1[] = {"Lectura1.txt"},
         dirLect2[] = {"Lectura2.txt"},
         actL1,
         actL2;

    int numeroLinea = 0,
        numeroCaracter = 0;

    FILE *archLect1,
        *archLect2;

    archLect1 = fopen(dirLect1, "r");
    archLect2 = fopen(dirLect2, "r");

    if (archLect1 && archLect2){
        printf("Ambos archivos leidos correctamente");

        fscanf(archLect1, "%c", &actL1);
        fscanf(archLect2, "%c", &actL2);
        while (!(feof(archLect1)||feof(archLect2))){
            if (actL1 == '\n'){
                ++numeroLinea;
                numeroCaracter = 0;
            }
            else
                ++numeroCaracter;

            if (actL1 != actL2)
                break;

            fscanf(archLect1, "%c", &actL1);
            fscanf(archLect2, "%c", &actL2);
        }

        printf("\nL1:%c L2:%c car:%d lin:%d", actL1, actL2, numeroCaracter, numeroLinea);
    }
    else{
        if (!(archLect1 || archLect2))
            printf("ERROR - NINGUN ARCHIVO se abrio correctamente");
        else
            printf("ERROR - %s no se abrio correctamente", archLect1 ? dirLect2 : dirLect1);
    }

    fclose(archLect1);
    fclose(archLect2);

    return 0;
}
