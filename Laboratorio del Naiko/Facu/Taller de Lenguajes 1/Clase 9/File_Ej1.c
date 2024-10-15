#include <stdio.h>
int main()
{  FILE * arch;

   arch = fopen("prueba.txt", "w");
   if (arch==NULL)
      fprintf(stdout, "Error al abrir el archivo!\n");
   else
      fprintf(stdout, "El archivo está abierto\n");

   fprintf(arch, "Este es mi primer archivo \n");
   fprintf(arch, "creado desde un programa C.");

   fclose(arch);
   printf("El archivo está cerrado\n");

   return 0;
}

