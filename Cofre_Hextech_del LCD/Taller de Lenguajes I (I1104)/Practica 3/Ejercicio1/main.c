#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define DIMF 10

struct rectangulo {
    float ancho;
    float largo;
};

struct camposV {
    struct rectangulo rect;
    float area;
};

struct rectangulo LeerRectangulo (struct rectangulo );
void Imprimir (struct rectangulo);
float CalcularArea (struct rectangulo);
void CargarVector (struct camposV []);
void Recorrer (struct camposV []);
float minimo (float, float);

int main()
{ struct camposV vectorRectangulo[DIMF];

    srand(time(NULL));
    CargarVector(vectorRectangulo);
    Recorrer(vectorRectangulo);
    return 0;
}

struct rectangulo LeerRectangulo ( struct rectangulo rect)
{
    rect.ancho = (float) rand()/(float) RAND_MAX;
    rect.largo = (float) rand()/(float) RAND_MAX;
    return rect;
}

void CargarVector (struct camposV v[])
{ int i;
  struct rectangulo recta;
    for (i=0; i<DIMF; i++) {
        v[i].rect = LeerRectangulo(recta);
        v[i].area = 0;
    }
}

void Imprimir (struct rectangulo rect){
    printf(" Ancho: %.2f cm ",rect.ancho);
    printf(" Largo: %.2f cm \n",rect.largo);
}

float CalcularArea (struct rectangulo rect)
{ float area;
    area = rect.ancho * rect.largo;
    return area;
};

float minimo (float area, float min)
{
    if (area < min) {
        return area;
    }
    return min;
}

void Recorrer (struct camposV v[])
{ int i;
  float min = 999;
  float areamin = 0;
    for(i=0; i<DIMF; i++)
    {
        printf(" Rectangulo %d \n ",i+1);
        Imprimir (v[i].rect);
        v[i].area = CalcularArea(v[i].rect);
        printf("  Area del rectangulo %d es: %.2f cm^2 \n",i+1,v[i].area);
        printf("----------------------------------------------------------- \n ");
        areamin = minimo(v[i].area,min);
    }
    printf("El area minima es: %.2f",areamin);
}
