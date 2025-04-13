#include <stdio.h>
#include <string.h>
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

void IncisoA(FILE *archO,FILE *ArchA)
{ int aux;
    aux = fgetc(archO);
    while (!feof(archO)){
        fputc(aux,ArchA);
        aux = fgetc(archO);
    }
}

void IncisoB(FILE *archO,FILE *ArchB)
{ char aux[100];
    fgets(aux,100,archO);
    fputs(aux,stdout);
    fputs(aux,ArchB);
//    while (!feof(archO)){
//        //fputs(aux,ArchB);
//        fputs(aux,stdout);
//        fgets(aux,10,archO);
//    }
}

void IncisoC(FILE *archO,FILE *ArchC)
{ int aux[100] ,aux2;
    fread(aux,sizeof(int),100,archO);
    aux2 = fwrite(aux,sizeof(int),100,ArchC);
}
