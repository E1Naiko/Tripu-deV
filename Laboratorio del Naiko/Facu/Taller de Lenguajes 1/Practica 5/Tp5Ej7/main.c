/*
    7) Escriba un programa que copie el contenido de un archivo de texto en otro nuevo.
    a) Utilizando las funciones fgetc y fputc.
    b) Utilizando las funciones fgets y fputs.
    c) Utilizando las funciones fread y fwrite.
*/

#include <stdio.h>
#include <stdlib.h>

void incisoA(FILE *, FILE*);
void incisoB(FILE *, FILE*);
void incisoC(FILE *, FILE*);

int main()
{
    FILE * archOriginal,
        *archResA,
        *archResB,
        *   archResC;

    archOriginal = fopen("Prueba.txt","r");
    if(!archOriginal){
        printf("ERROR - Archivo original no se abrio");
        return -1;
    }

    archResA = fopen("ResultadoA.txt","w");
    if(!archResA){
        printf("ERROR - Archivo Resultado A no se abrio");

        fclose(archOriginal);
        return -2;
    }

    archResB = fopen("ResultadoB.txt","w");
    if(!archResB){
        printf("ERROR - Archivo Resultado B no se abrio");

        fclose(archOriginal);
        fclose(archResA);
        return -3;
    }

    archResC = fopen("ResultadoC.txt","w");
    if(!archResC){
        printf("ERROR - Archivo Resultado C no se abrio");

        fclose(archOriginal);
        fclose(archResA);
        fclose(archResB);
        return -3;
    }

    incisoA(archOriginal, archResA);
    fseek(archOriginal, 0, SEEK_SET);

    incisoA(archOriginal, archResA);
    fseek(archOriginal, 0, SEEK_SET);

    incisoA(archOriginal, archResA);

    fclose(archOriginal);
    fclose(archResA);
    fclose(archResB);
    fclose(archResC);

    return 0;
}

void incisoA(FILE *A, FILE*R){
    char aux;
    aux = fgetc(A);
    while(!feof(A)){
        fputc(aux, A);
        aux = fgetc(A);
    }
}

void incisoB(FILE *A, FILE*R){
}

void incisoC(FILE *, FILE*){
}
