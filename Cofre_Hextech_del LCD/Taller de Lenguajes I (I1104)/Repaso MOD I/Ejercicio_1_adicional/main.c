#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define PAISES 5

struct pais {
    int cod;
    int cantEspecies;
};
typedef struct pais pais_t;

pais_t CargarInformacion (pais_t);
void CargarPaises (pais_t []);
void ProcesarPaises(pais_t []);

int main()
{ pais_t paises[PAISES];
  srand(time(NULL));
  CargarPaises(paises);
  ProcesarPaises(paises);
  return 0;
}

pais_t CargarInformacion (pais_t t)
{
    t.cod = rand()/10;
    t.cantEspecies= rand()/100;
    return t;
}

void CargarPaises (pais_t p[])
{   pais_t t;
    int i;
    for (i=0; i < PAISES; i++){
        p[i]= CargarInformacion(t);
    }
}

void ProcesarPaises(pais_t p[])
{ int i;
  int totalmayora40= 0;
  int min1= 0,min2= 0;
  float por;
    for (i=0; i<PAISES; i++){
        if (p[i].cantEspecies > 40){
            totalmayora40 = totalmayora40 + 1;
        }
        if (p[i].cantEspecies < p[min1].cantEspecies){
            min2= min1;
            min1 = i;
        } else {
            if (p[i].cantEspecies < p[min2].cantEspecies){
                    min2 = i;
            }
        }
        printf("Pais: %d\n", p[i].cod);
        printf("Cantidad: %d\n",p[i].cantEspecies);
    }
    por= (float)totalmayora40 / PAISES*100;
    printf("\nPorcentajes de paises que tienen mas de 40 especies: %.1f\n",por);
    printf("\nLos paises con menor cantidad de Especies son %d y %d\n",min1,min2);
}
