#include <stdio.h>
#include <stdlib.h>

void imprimirEnConsola(FILE *);
int main()
{ FILE *arch;
    int apuesta;
    float monto,total=0;
    char delimitador;
    arch = fopen("apuestas.txt", "r");
    if (arch) {
        imprimirEnConsola(arch);
        fseek(arch,0,SEEK_SET);
        fscanf(arch,"%d|%f%c",&apuesta,&monto,&delimitador);
        while (!feof(arch)) {
            total += monto;
            fscanf(arch,"%d|%f%c",&apuesta,&monto,&delimitador);
        }
        printf("\nEl monto total apostado es %.f",total);
        fclose(arch);
    } else {
        printf("archivo no encontrado");
        return 1;
    }
    return 0;
}
void imprimirEnConsola(FILE * archivoTXT){
    char act;
    if (archivoTXT){
        fseek(archivoTXT, 0, SEEK_SET);
        printf("\nImprimiendo archivo: ");
        fscanf(archivoTXT,"%c",&act);
        while (!(feof(archivoTXT))){
            printf("%c ", act);
            fscanf(archivoTXT,"%c",&act);
        }
    }
}
