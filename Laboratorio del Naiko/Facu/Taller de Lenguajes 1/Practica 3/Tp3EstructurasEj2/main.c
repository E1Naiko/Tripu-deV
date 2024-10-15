/*
3. Resuelva:

    **a1. Defina una estructura direccion que contenga los siguientes campos: calle (arreglo de 50
        caracteres), ciudad (arreglo de 30 caracteres), codigo_postal (int) y pais (arreglo de 40
        caracteres).
    **b1. Defina una estructura alu que contenga los siguientes campos: apellido (arreglo de 50
        caracteres), nombre (arreglo de 50 caracteres), legajo (arreglo de 8 caracteres), promedio
        (float) y domicilio (struct direccion).

    **a2. Renombre el tipo struct alu a alumno mediante la palabra clave typedef.
    **b2. Escriba una función que reciba un alumno y lo inicialice a partir de valores ingresados por
        teclado.
    c2. Escriba un programa que defina un arreglo de 30 elementos alumno y lo inicialice utilizando
        la función definida en el inciso anterior. Luego, informe el nombre y apellido del alumno que
        tiene mejor promedio.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DIMF_DIRECCION1 51
#define DIMF_DIRECCION2 31
#define DIMF_DIRECCION3 9
#define DIMF_ALU1 31
#define DIMF_ALU2 31
#define DIMF_ARREGLO 2

typedef struct dir{
    char calle[DIMF_DIRECCION1];
    char ciudad[DIMF_DIRECCION2];
    int codigo_postal;
    char pais[DIMF_DIRECCION3];
} direccion_t;

typedef struct alu{
    char nombre[DIMF_ALU1];
    char apellido[DIMF_ALU1];
    char legajo[DIMF_ALU2];
    float promedio;
    direccion_t domicilio;
} alumno;

typedef struct mejorPromedio_t{
    char nombre[DIMF_ALU1];
    char apellido[DIMF_ALU1];
    float promedio;
} mejorPromedio_td;

alumno innitAlumno();
void imprimirAlumno(alumno);

int main()
{
    int i;
    alumno arreglo[DIMF_ARREGLO];
    mejorPromedio_td mejorPromedio; /* NO ES LA SOLUCION OPTIMA PORQUE ESTOY GUARDANDO TODOS LOS DATOS DEL ALUMNO*/
        /* PERO ME PARECE LA MAS UTIL*/

    mejorPromedio.promedio = -1;
    strcpy(mejorPromedio.nombre, "ERROR");
    strcpy(mejorPromedio.apellido, "ERROR");

    for (i=0; i<DIMF_ARREGLO; i++)
        arreglo[i] = innitAlumno();

    for (i=0; i<DIMF_ARREGLO; i++)
        imprimirAlumno(arreglo[i]);

    for (i=0; i<DIMF_ARREGLO; i++)
        if (arreglo[i].promedio > mejorPromedio.promedio){
            strcpy(mejorPromedio.nombre, arreglo[i].nombre);
            strcpy(mejorPromedio.apellido, arreglo[i].apellido);
            mejorPromedio.promedio = arreglo[i].promedio;
    }

    printf("\n\n Mejor Promedio %s, %s con promedio: %2.2f", mejorPromedio.nombre, mejorPromedio.apellido, mejorPromedio.promedio);

    return 0;
}

alumno innitAlumno(){
    alumno a;

    /* Lectura alumno */
    printf("Ingrese el nombre del alumno: ");
    scanf("%s", a.nombre);
    printf("Ingrese el apellido del alumno: ");
    scanf("%s", a.apellido);
    printf("Ingrese el legajo del alumno: ");
    scanf("%s", a.legajo);
    printf("Ingrese el promedio del alumno: ");
    scanf("%f", &a.promedio);

    /* Lectura direccion */
    printf("\nDomicilio:");
    printf("Ingrese la calle: ");
    scanf("%s", a.domicilio.calle);
    printf("Ingrese la ciudad: ");
    scanf("%s", a.domicilio.ciudad);
    printf("Ingrese el codigo postal: ");
    scanf("%d", &a.domicilio.codigo_postal);
    printf("Ingrese el pais: ");
    scanf("%s", a.domicilio.pais);

    return a;
}

void imprimirAlumno(alumno a){
    printf("\nAlumno %s, %s:", a.nombre, a.apellido);
    printf("\n - Legajo: %s", a.legajo);
    printf("\n - Promedio: %2.2f", a.promedio);
    printf("\n - Domicilio: %s, %s, %s:", a.domicilio.calle, a.domicilio.ciudad, a.domicilio.pais);
    printf("\n - Codigo Postal %d:", a.domicilio.codigo_postal);
}
