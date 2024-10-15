/*
1. Resuelva:
    ¬¬a) Defina una estructura rectangulo que contenga los siguientes campos: base(float) y altura (float).
    ¬¬b) Escriba una funcion que reciba una estructura rectangulo y la inicialice a partir de valores ingresados por teclado.
    ¬¬c) Escriba una funcion que dada una estructura rectanggulo, calcule el area.
    ¬¬d) Escriba un programa que defina un arreglo de 10 rectangulos (struct rectangulo) y lo inicialice utilizando la funcion definida
    en el inciso anterior. Luego, informe el numero de rectangulos que tiene menor area.
*/

#include <stdio.h>
#include <stdlib.h>

#define DIMF 2

typedef struct rectangulo{
    float base;
    float altura;
} rectangulo_t;

rectangulo_t inicializarRectangulo();
float calcArea(rectangulo_t);

void imprimirArreglo(rectangulo_t []);

int main()
{
    int i, menorIdActual=-1;
    float menorAreaActual = 999999, auxArea;
    rectangulo_t arregloRectangulos[DIMF];

    for (i=0; i<DIMF; i++){
        arregloRectangulos[i] = inicializarRectangulo();
    }

    imprimirArreglo(arregloRectangulos);

    for (i=0; i<DIMF; i++){
        auxArea = calcArea(arregloRectangulos[i]);
        if (auxArea<menorAreaActual){
            menorAreaActual = auxArea;
            menorIdActual = i;
        }
    }

    if(menorIdActual != -1)
        printf("\nMenor Area Encontrada %.2f en %d.", menorAreaActual, menorIdActual);

    return 0;
}

rectangulo_t inicializarRectangulo(){
    rectangulo_t r;

    printf("\nIntroduzca la base del rectangulo: ");
    scanf("%f", &r.base);
    printf("Introduzca la altura del rectangulo: ");
    scanf("%f", &r.altura);

    return r;
}

float calcArea(rectangulo_t r){
    float area;

    area = r.altura*r.base;

    return area;
}

void imprimirArreglo(rectangulo_t r[]){
    int i;
    printf("\n[%.2f,%.2f ", r[0].base, r[0].altura);
    for (i=1; i<DIMF; i++){
        printf("| %.2f,%.2f ", r[i].base, r[i].altura);
    }
    printf("]");
}
