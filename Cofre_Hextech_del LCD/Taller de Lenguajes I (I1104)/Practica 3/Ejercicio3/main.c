#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define DIML 2
typedef struct direccion {
    char calle [50];
    char ciudad [30];
    int cod_postal;
    char pais[40];
} t_direccion;

typedef struct alu {
    char apellido[50];
    char nombre[50];
    char legajo[8];
    float promedio;
    t_direccion direc;
}t_alumno;

void CargarDireccion(t_direccion);

t_alumno CargarAlumno (t_alumno);
void ImprimirAlumno(t_alumno);
void CargarVector (t_alumno []);
void RecorrerVector(t_alumno []);

int main()
{ t_alumno alumnos[DIML];

    CargarVector(alumnos);
    RecorrerVector(alumnos);

    printf("Hello world!\n");
    return 0;
}

void CargarDireccion (t_direccion dire)
{
    printf("Calle: ");
    scanf(" %s", dire.calle);
    fflush(stdin);
    printf("Ciudad: ");
    scanf(" %s", dire.ciudad );
    fflush(stdin);
    printf("Codigo Postal: ");
    scanf(" %d", &dire.cod_postal);
    fflush(stdin);
    printf("Pais: ");
    scanf(" %s", dire.pais);
}
t_alumno CargarAlumno (t_alumno alun)
{
    printf("Cargar Nombre: ");
    fflush(stdin);
    scanf(" %s", alun.apellido);
    fflush(stdin);
    printf("Cargar Apellido: ");
    fflush(stdin);
    scanf(" %s", alun.nombre);
    printf("Cargar Legajo: ");
    fflush(stdin);
    scanf(" %s", alun.legajo);
    printf("Cargar Promedio: ");
    fflush(stdin);
    scanf(" %f", &alun.promedio);
    printf("----Cargar Direccion---- \n");
    CargarDireccion(alun.direc);
    return alun;
}
void CargarVector (t_alumno v[])
{ int i;
  t_alumno alumno;
    for (i=0; i<DIML; i++)
    {
        printf("--------------------------- \n");
        v[i] = CargarAlumno(alumno);
    }
}
void ImprimirAlumno (t_alumno alu)
{
    printf(" Nombre: %s %s",alu.nombre,alu.apellido);
    printf(" Legajo: %s\n",alu.legajo);
    printf(" Promedio: %f\n",alu.promedio);
    printf(" Direccion: %s, %d, %s, - %s",alu.direc.calle, alu.direc.cod_postal, alu.direc.ciudad, alu.direc.pais);
}

void RecorrerVector (t_alumno v[])
{ int i;
    printf("-------------------------- \n");
    for(i=0; i<DIML; i++)
    {
        printf("Alumno N %d \n",i+1);
        ImprimirAlumno(v[i]);
        printf("\n");
    }

}
