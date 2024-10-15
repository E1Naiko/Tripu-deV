/*
c. Defina la estructura pun3D, la cual representa una posición en el espacio. La misma debe
contener los campos x (float), y (float) y z (float). Luego:
a. Renombre la estructura pun3D a punto3D utilizando la palabra clave typedef.
b. Imprima en pantalla el tamaño del tipo struct pun3D. ¿Cuánto ocupa? ¿Por qué?
c. Imprima en pantalla el tamaño del tipo punto3D. ¿Cuánto ocupa? ¿Es igual al de struct
pun3D? ¿Por qué?

d. Defina un arreglo de 4 elementos de tipo punto3D e imprima en pantalla el espacio ocupado
por el mismo. ¿Cuánto ocupa? ¿Por qué?
*/

#include <stdio.h>
#include <stdlib.h>

typedef struct pun3D{
    float x, y,z;
} punto3D;

int main()
{
    punto3D pnt;
    pnt.x = 1;
    pnt.y = 2;
    pnt.z = 3;

    punto3D a[4];
    int i;
    for (i=0; i<4; i++){
        a[i].x= rand();
        a[i].y= rand();
        a[i].z= rand();
    }

    printf("Punto x ocupa %lu bytes, Punto y ocupa %lu bytes, Punto z ocupa %lu bytes", sizeof(pnt.x), sizeof(pnt.y), sizeof(pnt.z));
    printf("\nPunto3D ocupa %lu bytes.", sizeof(pnt));

    printf("\nArreglo de Punto3D ocupa %lu bytes.", sizeof(a));
    return 0;
}
