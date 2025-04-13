#ifndef FUNCIONES_H_INCLUDED
#define FUNCIONES_H_INCLUDED

struct nodo {
    int dato;
    struct nodo* sig;
};

typedef struct nodo* Lista;

void Inicializar (Lista *);
void Eliminar(Lista *);
void AgregarAdelante(Lista *,int);
void AgregarFinal(Lista *,int);
void Imprimir (Lista *);
void Recorrer(Lista *);
void Multiplos(Lista *,int);
void InsertarOrdenado (Lista *,int);

#endif // FUNCIONES_H_INCLUDED
