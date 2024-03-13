
Program BPFA;

Procedure recorrerSecuenciaDeCaracteres(devuelveCantCaracteres, devuelveCantPalabras: integer);
// RECORRE UNA SECUENCIA DE CARACTERES Y DEVUELVE LA CANTIDAD DE PALABRAS Y CARACTERES QUE LA CONFORMAN
// EL ESPACIO NO ES CONCIDERADO COMO CARACTER
// LA LECUTURA TERMINA CUANDO SE ENCUENTRA EL CARACTER <termina> O CUANDO LLEGA A <cantTotal> DE CARACTERES

Const 
    termina =   'z';
    cantTotal =   500;
Procedure descartarBlancos(Var act:char; Var cont:integer);
Begin
    While (act=' ') And (cont<cantTotal) Do
        Begin
            read(act);
            cont := cont+1;
        End;
End;
Procedure recorrerPalabra(Var act:char; Var contGeneral: integer);
Begin
    While (act<>' ') And (act<>termina) And (contGeneral<cantTotal) Do
        Begin
            contGeneral := contGeneral+1;
            ant := act;
            read(act);
        End;
End;

Var 
    // anterior para guardar posible ultimo caracter, y actual para el lector de caracteres
    ant, act:   char;

    // contadores
    contGeneral, contPalabras:   integer;

Begin
    // Inicializo variables
    contGeneral := 0;
    contPalabras := 0;
    ant := ' ';
    act := ' ';

    // Prog Ppal.
    //writeln(' --- Introduzca una secuencia de caracteres: ');

    Repeat
        Begin
            ant := act;
            read(act);

            descartarBlancos(act,contGeneral);

            // SI O SI me encuentro al prinicipio de una palabra        
            contPalabras := contPalabras+1;

            // recorro el interior de la palabra
            recirrerPalabra(act,contGeneral);

            // SI O SI estoy al final de una palabra

        End
    Until (contGeneral=cantTotal) Or (act=termina);

    // informo
    //writeln(' - Palabras totales: ',contPalabras);

End;

// ------------------------------------- Listas -------------------------------------


{
    lista = ^nodo;
    nodo = record
        datos: integer;
        sig: lista;
    end;
    Tlista = record
        pri, ult: lista;
    end;
}

Procedure liberarMem(Var l:lista);

Var aux:   lista;
Begin
    While (l<>Nil) Do
        Begin
            aux := l;
            l := l^.sig;
            dispose(aux);
        End;
End;

Procedure imprimirLista(l:lista);
Begin
    writeln('-----------------------------------------');
    While (l<>Nil) Do
        Begin
            writeln();
            l := l^.sig;
        End;
End;

Procedure agregarFinal(Var l: Tlista; elem: integer {cambiar});

Var nue:   lista;
Begin
    new(nue);
    nue^.datos := elem;
    nue^.sig := Nil;

    If pri=Nil Then l.pri := nue
    Else l.ult^.sig := nue;
    l.ult := nue;
End;

Procedure borrarElemento(Var l: lista; nom:cadena; Var exito: Boolean);

Var ant, act:   lista;
Begin
    exito := false;
    act := l;

    // Busco el elemento
    While (act<>Nil) And Not(exito) Do
        Begin
            If (act^.datos.nom=nom) Then exito := True
            Else
                Begin
                    ant := act;
                    act := act^.sig;
                End;
        End;

    // lo elimino
    If exito Then
        Begin
            If (act=l) Then l := act^.sig
            Else ant^.sig := act^.sig;
            dispose(act);
        End;
End;

Procedure insertarElemento (Var l: lista; elem:integer);
// ORDENADO

Var nue, ant, act:   lista;
Begin
    new(nue);
    nue^.datos := elem;
    act := l;
    ant := l;

    // busco pos
    While (act<> Nil) And (act^.datos <> elem) Do
        Begin
            // CAMBIAR
            ant := act;
            act := act^.sig;
        End;

    // inserto
    If (ant = act) Then l := nue // dato va al principio
    Else ant^.sig := nue;
    // intermedio/final
    nue^.sig := act;
End;

procedure insertarOrdenado(var l: lista; elemento: integer);
var nue, ant, act: lista;
begin
    new(nue); nue^.datos:= elemento; nue^.sig:= nil;
    act:=l; act:=l;

    while (act<>nil) and (act^.datos < elemento) do begin
        ant:= act; act:=act^.sig;
    end;

    if (l=act) then l:= nue
                else ant^.sig:= nue;
    nue^.sig:=act;
end;




Begin
End.
