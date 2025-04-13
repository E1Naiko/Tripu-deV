#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef enum{CUADRADO,TRIANGULO,CIRCULO} FIGURAS;
typedef struct
{   FIGURAS tipo;
    char color[20];
    union FIGU
    {
        struct {
            float lado;
        } cuadra;
        struct
        {
            float radio;
        } circu;
        struct
        {
            float base,altura;
        } triangu;
    };
}Figura;
void imprimirFigura(Figura);
void CargarFigura(Figura);
int main()
{   Figura Fig;

    imprimirFigura(Fig);
    return 0;
}

void CargarFigura(Figura f)
{int i
    printf(" Pija ");
    scanf
}
void imprimirFigura( Figura f)
{
     switch (f.tipo) {
        case CUADRADO:
            printf(" Es un Cuadrado: ");
            printf(" Color: %s",f.color);
            printf(" Area: %.3f", (f.cuadra.lado*f.cuadra.lado));
            break;
        case TRIANGULO:
            printf(" Es un Triangulo: ");
            printf(" Color: %s",f.color);
            printf(" Area: %.3f", (f.triangu.base * f.triangu.altura)/2);
        break;
        case CIRCULO:
            printf(" Es un Circulo: ");
            printf(" Color: %s",f.color);
            printf(" Area: %.2f",M_PI * (f.circu.radio * f.circu.radio) );
            break;
        default:
            printf("Figura Desconocida");
}
}
