#ifndef BIBIOTECA_H_INCLUDED
#define BIBIOTECA_H_INCLUDED
#define MAX_LENGTH 256
typedef struct nodo {
    char * palabra;
    struct nodo *sig;
}nodo_t;

typedef struct {
    nodo_t *tabla[MAX_LENGTH];
}diccionario;

diccionario* crear_Diccionario ();
int agregar_Palabra (diccionario*, const char*);
int existe_Palabra (diccionario*, const char*);
int eliminar_Palabra (diccionario*, const char*);
int cargar_desdeArchivo (diccionario*, const char*);
void destruir_Diccionario (diccionario*);

#endif // BIBIOTECA_H_INCLUDED
