
{
        La empresa se encuentra desarrollando un sistema de versionado de un
    documento. Para esto, se guardan hasta un máximo de 40 versiones del
    documento. De cada versión se conoce, el título, un link al texto completo y
    la fecha en formato UNIX (un entero). Esta información se encuentra ordenada
    por fecha. Se nos asigna desarrollar:

    1. Un método que reciba las últimas
        versiones de un documento, y una fecha en formato UNIX, y retorne la versi�
        �n correspondiente a esa fecha. En caso de no encontrar una versión retornar
        una versión con título “Inexistente”.

    2. Modificar el método del punto anterior
        para que, en caso de no encontrar la versión, devolver la versión
        con la fecha más cercana.
}

Program tp6ADDej3;

Uses crt;

Const 
    DIMF =   40;

Type 
    subrIndice =   0 .. DIMF;
    cadena =   string;
    tipoVersion =   Record
        titulo, link:   cadena;
        fecha:   integer;
    End;
    arrVersiones =   array [1..DIMF] Of tipoVersion;
    tipoDocumento =   Record
        dimL:   subrIndice;
        vec:   arrVersiones;
    End;

    // ----------------------------- MODULOS -----------------------------


    // ----------------------------- PROGRAMA PRINCIPAL -----------------------------
Begin

End.
