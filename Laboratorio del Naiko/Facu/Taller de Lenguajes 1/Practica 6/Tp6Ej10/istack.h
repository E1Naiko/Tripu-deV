#ifndef ISTACK_H_INCLUDED
#define ISTACK_H_INCLUDED
    typedef struct nodo{
            int valor;
            struct * nodo*sig;
        } stack;

    stack* s_create (); // i – Retorna una nueva pila. Se debe invocar antes de manipular cualquiera de ellas.
    int s_push(stack* s, int n); // ii – Apila n en s. Retorna el elemento apilado.
    int s_pop (stack* s); // iii – Desapila un elemento de s.
    int s_top (stack s); // iv – Retorna el próximo elemento que será desapilado.
    int s_empty(stack s; // v – Retorna 1 si s está vacía, 0 en caso contrario.
    int s_length(stack s); // vi – Retorna la cantidad de elementos apilados en s.

#endif // ISTACK_H_INCLUDED
