/*

6. Implemente un tipo de datos Fecha para almacenar día, mes y año teniendo en cuenta las siguientes
observaciones:
a. Utilice un formato que sea “cómodo” para trabajar con fechas
b. Como las comparaciones entre fechas son algo engorrosas, utilice una unión para realizar
un “hack” que utilice un campo adicional que se superponga con la fecha y permita
compararlas directamente (estudiar orden y tamaño de cada campo de la fecha).
c. Implemente un programa que compare distintas fechas para demostrar que esta
estrategia funciona (puede aprovechar la declaración de las variables para asignar las
fechas).
d. ¿Cree que esta implementación funcionaría para todos los compiladores de C sin importar
la arquitectura del procesador? (Pista: Little endian vs. Big endian) -> NON

*/

#include <stdio.h>
#include <stdlib.h>

union unFechas{
    struct XX{
            char dia, mes;
            short int anio;
        } comoda;
    int hack;
};

typedef struct {
    int tipo; /* Tipos del 1 al 2 */
    union unFechas fecha;
} fecha_t;

void imprimirDatos(fecha_t);

int main()
{
    fecha_t fecha1, fecha2;
    printf("\n Tamaño tipo 1 - dia: %lu bytes", sizeof(fecha1.fecha.comoda.dia));
    printf("\n Tamaño tipo 1 - mes: %lu bytes", sizeof(fecha1.fecha.comoda.mes));
    printf("\n Tamaño tipo 1 - anio: %lu bytes", sizeof(fecha1.fecha.comoda.anio));
    printf("\n Tamaño tipo 2: %lu bytes", sizeof(fecha1.fecha.hack));

    fecha1.tipo = 1;
    printf("\nIngrese la primer fecha (dd-mm-aa):");
    scanf(" %hd", &fecha1.fecha.comoda.dia);
    scanf(" %hd", &fecha1.fecha.comoda.mes);
    scanf(" %hd", &fecha1.fecha.comoda.anio);

    fecha2.tipo = 1;
    printf("\nIngrese la segunda fecha (dd-mm-aa):");
    scanf(" %hd", &fecha2.fecha.comoda.dia);
    scanf(" %hd", &fecha2.fecha.comoda.mes);
    scanf(" %hd", &fecha2.fecha.comoda.anio);

    imprimirDatos(fecha1);
    imprimirDatos(fecha2);

    fecha1.tipo = 2;
    fecha2.tipo = 2;
    imprimirDatos(fecha1);
    imprimirDatos(fecha2);

    int res = fecha1.fecha.hack - fecha2.fecha.hack;
    if (res){
        if (res>0) printf("\nFecha1>Fecha2");
        else printf("\nFecha1<Fecha2");
    }
    else
        printf("\nFecha1=Fecha2");

    fecha1.tipo = 1;
    fecha2.tipo = 1;
    imprimirDatos(fecha1);
    imprimirDatos(fecha2);

    return 0;
}

void imprimirDatos(fecha_t f){
    printf("\n");
    switch (f.tipo){
        case 1:
            printf("\nTIPO - FECHA COMODA %d-%d-%d",
                   f.fecha.comoda.dia, f.fecha.comoda.mes, f.fecha.comoda.anio);
        break;
        case 2:
            printf("\nTIPO - HACK %d", f.fecha.hack);
        break;
        default:
            printf("\nERROR TIPO NO ADMITIDO");
    }
}
