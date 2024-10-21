#include <stdio.h>
#include <stdlib.h>

int main()
{ FILE *arch;
    char text[100];
    int minus=0;int mayus=0;int digi=0;
    char caracter;

    arch = fopen("ejercicio2.txt", "w+");
    if (arch == NULL) {
        fprintf(stdout,"Archivo no encontrado");
        return 1;
     } else {
        fprintf(stdout, "Escribir Texto");
        fgets(text,sizeof(text),stdin);
        fprintf(arch,text);
     }
    fseek(arch,0,SEEK_SET);
    fgets(caracter,100,arch);
    while (!feof(arch)){
        if ((caracter <= 'a') && (caracter >= 'z')){
            minus++;
        } else {
            if ((caracter <= 'A') && (caracter >= 'Z')) {
                mayus++;
            } else {
                if ((caracter <= '0') && (caracter >= '9')) digi++;
            }
        }
        fgets(caracter,100,arch);
    }
    printf("Cant minuscula: %d",minus);
    printf("Cant mayuscula: %d",mayus);
    printf("Cant digitos: %d",digi);
    fclose(arch);
    return 0;
}
