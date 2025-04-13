#include <stdio.h>
#include <stdlib.h>

typedef enum {LUN=1,MAR,MIE,JUE,VIE,SAB,DOM} dias;
void imprimirdia(int);
int main()
{ int dia;
    printf("Escribir nro dia \n ");
    scanf("%d",&dia);
    imprimirdia(dia);
    return 0;
}
void imprimirdia (int d)
{
    switch(d)
    {   case LUN:
            printf("el dia es Lunes");
            break;
    case MAR:
        printf("el dia es Martes");
        break;
    case MIE:
        printf("el dia es Miercoles");
        break;
    case JUE:
        printf("el dia es Jueves");
        break;
    case VIE:
        printf("el dia es Viernes");
        break;
    case SAB: printf("el dia es Sabado"); break;
    case DOM: printf("el dia es Viernes"); break;
    default :
        printf("Dia Erroneo");
    }
}
