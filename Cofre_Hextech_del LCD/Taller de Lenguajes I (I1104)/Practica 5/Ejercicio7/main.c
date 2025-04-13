#include <stdio.h>
#include <stdlib.h>
#include "Ejerci7.h"

int main()
{ FILE *archOriginal; FILE *archBinario;
FILE* archA; FILE* archB; FILE* archC;
    archOriginal= fopen("Original.txt","r");
    if (archOriginal) {
        printf("Se abrio el archivo Original\n");
    } else {
        printf("No se abrio el archivo Original\n");
        return -1;
    }
    archBinario= fopen("Original.txt","rb");
    if(archBinario){
        printf("Se abrio el archivo Binario\n");
    } else {
        printf("No se abrio el archivo Binario\n");
        fclose(archOriginal);
        return -2;
    }
    archA = fopen("IncisoA.txt","w");
    if (archA){
        printf ("\nSe abrio el archivo A\n");
    } else {
        printf("No se abrio el archivo A\n");
        fclose(archOriginal);
        fclose(archBinario);
        return -3;
    }
    archB = fopen("IncisoB.txt","w");
    if (archB){
        printf ("\nSe abrio el archivo B\n");
    } else {
        printf("No se abrio el archivo B\n");
        fclose(archOriginal);
        fclose(archBinario);
        fclose(archA);
        return -3;
    }
    archC = fopen("IncisoC.txt","wb");
    if (archC){
        printf ("\nSe abrio el archivo C\n");
    } else {
        printf("No se abrio el archivo C\n");
        fclose(archOriginal);
        fclose(archBinario);
        fclose(archA);
        fclose(archB);
        return -4;
    }
    fseek(archOriginal,0,SEEK_SET);
    IncisoA(archOriginal,archA);
    fseek(archOriginal,0,SEEK_SET);
    IncisoB(archOriginal,archB);
    fseek(archBinario,0,SEEK_SET);
    IncisoC(archBinario,archC);
    fclose(archOriginal);
    fclose(archBinario);
    fclose(archA);
    fclose(archB);
    fclose(archC);
    return 0;
}

