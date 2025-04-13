#include <stdio.h>
#include <stdlib.h>
void imprimirEnConsola(FILE *);
int main()
{ FILE *arch;
    char caract;
    int milimetro;
    int max = 0, maxmili=0,i=0;
    arch = fopen("precipitaciones.txt","r");
    if(arch){
        imprimirEnConsola(arch);
        fseek(arch,0,SEEK_SET);
        fscanf(arch,"%c%d",&caract,&milimetro);
        while (!feof(arch)){
            if (milimetro > maxmili) {
                maxmili = milimetro;
                max= i+1;
            }
            i++;
            fscanf(arch,"%c%d",&caract,&milimetro);
        }
        printf("\nEl dia %d tiene mayor precipitacion : %d mm ",max,maxmili);
        fclose(arch);
    } else {
        printf("Archivo no encontrado");
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
