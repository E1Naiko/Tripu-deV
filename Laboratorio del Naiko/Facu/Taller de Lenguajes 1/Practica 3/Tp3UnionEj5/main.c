/*
5. Muchas veces al trabajar en modo gráfico con ventanas se necesitan las dimensiones (posición x,
posición y, ancho y alto) de diferentes formas para pasarlas como parámetros a distintas funciones.

Defina una unión que comparta estas 3 formas de acceso para la definición de un rectángulo de una
ventana: todas separadas (x, y, ancho, alto), como dos puntos ([x1, y1], [x2, y2] o [x, y], [ancho, alto]) o
todas juntas como un rectángulo ([x, y, ancho, alto])
*/

#include <stdio.h>
#include <stdlib.h>

struct defTodasSeparadas{
    int x, y, alto, ancho;
};

struct defDosPuntos{
    int punto1[2], punto2[2];
};

union unRectangulo{
    struct defTodasSeparadas todasSeparadas;
    struct defDosPuntos dosPuntos;
    int todasJuntas[4];
};

typedef struct rectangulo{
    int tipo; /* Tipos del 1 al 3 */
    union unRectangulo rect;
} rectangulo_t;

void imprimirDatos(rectangulo_t);

int main()
{
    rectangulo_t r;

    printf("Tamaño de la union: %du", sizeof(r.rect));

    r.tipo = 0;
    imprimirDatos(r);

    r.tipo = 1;
    r.rect.todasSeparadas.x = 1;
    r.rect.todasSeparadas.y = 1;
    r.rect.todasSeparadas.ancho = 1;
    r.rect.todasSeparadas.alto = 1;
    imprimirDatos(r);

    r.tipo = 2;
    r.rect.dosPuntos.punto1[0] = 2;
    r.rect.dosPuntos.punto1[1] = 2;
    r.rect.dosPuntos.punto2[0] = 2;
    r.rect.dosPuntos.punto2[1] = 2;
    imprimirDatos(r);

    r.tipo = 3;
    r.rect.todasJuntas[0] = 3;
    r.rect.todasJuntas[1] = 3;
    r.rect.todasJuntas[2] = 3;
    r.rect.todasJuntas[3] = 3;
    imprimirDatos(r);

    return 0;
}

void imprimirDatos(rectangulo_t r){
    int i;
    printf("\n");
    switch (r.tipo){
        case 1:
            printf("\nTIPO - TODAS SEPARADAS (x, y, ancho, alto): %d, %d, %d, %d.",
                   r.rect.todasSeparadas.x, r.rect.todasSeparadas.y, r.rect.todasSeparadas.ancho, r.rect.todasSeparadas.alto);
        break;
        case 2:
            printf("\nTIPO - DOS PUNTOS ([x1, y1], [x2, y2]): [%d,%d], [%d,%d].",
                   r.rect.dosPuntos.punto1[0], r.rect.dosPuntos.punto1[1], r.rect.dosPuntos.punto2[0], r.rect.dosPuntos.punto2[1]);
        break;
        case 3:
            printf("\nTIPO - JUNTAS ([x, y, ancho, alto]): [");
            printf("%d", r.rect.todasJuntas[0]);
            for (i=1; i<4; printf(",%d", r.rect.todasJuntas[i]), i++);
            printf("].");
        break;
        default:
            printf("\nERROR TIPO NO ADMITIDO");
    }
}
