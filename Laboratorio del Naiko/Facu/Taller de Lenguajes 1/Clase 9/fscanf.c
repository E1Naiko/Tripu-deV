/* Archivos de texto */
#include <stdio.h>
int main()
{  FILE * Ptr;
   float fn1, fn4;
   int n2, n3;

   Ptr = fopen ("numeros.txt","r");

   if ( Ptr ) {
     printf("El archivo \"Numeros.txt\" esta abierto\n")  ;

     fscanf(Ptr, "%f %d %d %f", &fn1, &n2, &n3, &fn4);
     while (! feof(Ptr))
     {   printf("%.1f %d %d %.1f\n", fn1, n2, n3, fn4);
         fscanf(Ptr, "%f %d %d %f", &fn1, &n2, &n3, &fn4);
     }

     fclose (Ptr);
	 }
   else printf("Error al abrir \"Numeros.txt\"\n");

   return 0;
}
