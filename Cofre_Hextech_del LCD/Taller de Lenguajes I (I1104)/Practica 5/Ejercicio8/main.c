#include <stdio.h>
#include <stdlib.h>
#include "RecorrerXD.h"

int main()
{ int numeros,grabado,cont =0;
  //int numeroBinarios[11];
  FILE *arch1; FILE *arch2;
    arch1= fopen("Numeros.txt","w");
    arch2= fopen("Numeros.dat","wb");
    if ((arch1) && (arch2)) {
        printf("Escribir numero (0 al 9)");
        scanf("%d",&numeros);
        while (cont <= 10) {
            //numeroBinarios[cont] = numeros;
            fprintf(arch1,"%d",numeros);
            grabado= fwrite(&numeros,sizeof(int),1,arch2);
            scanf("%d",&numeros);
            cont++;
        }
        imprimirEnConsola(arch1);
        fclose(arch1);
        fclose(arch2);
    } else {
        printf ("\nNo se abrio los archivos\n");
    }
    return 0;
}
