#include <stdio.h>
#include <stdlib.h>

int main()
{ char palabra[21];
  char menorpalabra[21];
  int longi, longimenor=21;
    printf("Escribir Palabra: \n");
    while (1){
    scanf("%s",palabra);
    if(strcmp(palabra,'FIN')==0){
        break;
    }
    longi= strlen(palabra);
    if(longi < longimenor) {
        longimenor=longi;
        strcpy(menorpalabra,palabra);
    }
    }
    printf("la menor palabra es: %s",menorpalabra);
    return 0;
}
