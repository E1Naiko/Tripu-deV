#include <stdio.h>
int main()
{ /* agregar líneas al archivo prueba.txt */
  FILE * arch;
  char c;

  /*abre el archivo para lectura*/
  arch = fopen("Lectura1.txt", "r");
  if (arch=NULL) {
      printf("Error al abrir el arch.!!\n");
  }
  else {  /* abrió bien */

    fclose(arch);
  }
  return 0;
}
