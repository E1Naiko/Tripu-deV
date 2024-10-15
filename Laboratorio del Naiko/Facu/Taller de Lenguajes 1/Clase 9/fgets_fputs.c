/* Imprime el contenido de un
   archivo de texto            */
#include <stdio.h>
int main()
{  FILE * arch;
   char linea[256];

   arch = fopen("Lectura1.txt", "r");
   if (arch==NULL)
      printf("Error al abrir el arch.!\n");
   else {
      fgets(linea, 10, arch);
      while (! feof(arch)) {
          fputs(linea, stdout);
          fgets(linea, 10, arch);
      }
      fclose(arch);
   }
   return 0;
}
