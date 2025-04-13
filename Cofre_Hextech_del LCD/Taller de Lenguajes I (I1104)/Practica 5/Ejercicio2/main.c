#include <stdio.h>
#include <stdlib.h>

void imprimirEnConsola(FILE *);
int main()
{ FILE *arch;
    int minus=0;int mayus=0;int digi=0;
    char caracter;

    arch = fopen("ejercicio2.txt", "w+");
    if (arch) {
        fprintf(arch, "Escribir Texto123");
        imprimirEnConsola(arch);
        printf("\n");
        fseek(arch,0,SEEK_SET);
        fscanf(arch,"%c",&caracter);
        while (!feof(arch)){
            if ((caracter >= 'a') && (caracter <= 'z')) minus++;
            if ((caracter >= 'A') && (caracter <= 'Z')) mayus++;
            if ((caracter >= '0') && (caracter <= '9')) digi++;
            fscanf(arch,"%c",&caracter);
        }
        printf("Cant minuscula: %d \n",minus);
        printf("Cant mayuscula: %d \n",mayus);
        printf("Cant digitos: %d \n",digi);
        imprimirEnConsola(arch);
        fclose(arch);
    } else {
        fprintf(stdout,"Archivo no encontrado");
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
