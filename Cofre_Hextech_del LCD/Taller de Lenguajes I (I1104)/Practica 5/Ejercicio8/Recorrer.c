#include <stdio.h>

void imprimirEnConsola(FILE * archivoTXT){
    int act;
    if (archivoTXT){
        //fseek(archivoTXT, 0, SEEK_SET);
        printf("\nImprimiendo archivo: ");
        fscanf(archivoTXT,"%d",&act);
        while (!(feof(archivoTXT))){
            printf("%d ", act);
            fscanf(archivoTXT,"%d",&act);
        }
    }
}
