#include <stdio.h>
int main()
{ /* Muestra el contenido del arch. */
  FILE * F1, F2;
  char c1, c2;

  F1 = fopen("Lectura1.txt", "r");
  F2 = fopen("Lectura2.txt", "r");

  if (F1 && F2) {
    printf("Los archivos se abrieron bien\n");
    c1 = fgetc(F1);
    c2 = fgetc(F2);
    nlinea=1;  /* nro. de linea actual */
    ncarac=1;  /* nro.de carac.en la linea */
    while ((!feof(F1)) && (!feof(F2)) &&
          (c1 == c2)){
       if (c1 =='\n') nlinea++; ncarac=0;
       ncarac++;
       c1 = fgetc(F1);
       c2 = fgetc(F2);
     }
    /* decir si son iguales o no */
    if (feof(F1) && feof(F2))
           printf("Son iguales!!!!!");
      else {
           printf("Son distintos !!\n");
           printf("Vea el caracter %d "
           "de la linea %d\n",ncarac,nlinea);
      }
    fclose(F1);
    fclose(F2);
  }
  return 0;
}
