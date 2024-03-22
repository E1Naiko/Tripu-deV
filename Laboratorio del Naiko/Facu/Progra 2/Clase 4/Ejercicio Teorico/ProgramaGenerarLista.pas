
Program ProgramaGenerarArbol;

Const 
    absurdo =   99999;

Type 

    // Lista de enteros
    lista =   ^nodoL;
    nodoL =   Record
        dato:   integer;
        sig:   lista;
    End;

    // Arbol de enteros
    arbol =   ^nodoA;
    nodoA =   Record
        dato:   integer;
        HI:   arbol;
        HD:   arbol;
    End;

    // Lista de Arboles
    listaNivel =   ^nodoN;
    nodoN =   Record
        info:   arbol;
        sig:   listaNivel;
    End;






{-----------------------------------------------------------------------------
AgregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(Var l: Lista; nro: integer);

Var 
    aux:   lista;
Begin
    new(aux);
    aux^.dato := nro;
    aux^.sig := l;
    l := aux;
End;







{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con números aleatorios }
Procedure crearLista(Var l: Lista);

Var 
    n:   integer;
Begin
    l := Nil;
    n := random (20)+10;
    While (n <> 0) Do
        Begin
            agregarAdelante(L, n);
            n := random (20);
        End;
End;






{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
Procedure imprimirLista(l: Lista);
Begin
    While (l <> Nil) Do
        Begin
            write(l^.dato, ' - ');
            l := l^.sig;
        End;
End;





{-----------------------------------------------------------------------------
CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

Function ContarElementos (l: listaNivel):   integer;

Var c:   integer;
Begin
    c := 0;
    While (l <> Nil) Do
        Begin
            c := c+1;
            l := l^.sig;
        End;
    contarElementos := c;
End;






{-----------------------------------------------------------------------------
AGREGARATRAS - Agrega un elemento atrás en l}

Procedure AgregarAtras (Var l, ult: listaNivel; a:arbol);

Var nue:   listaNivel;

Begin
    new (nue);
    nue^.info := a;
    nue^.sig := Nil;
    If l= Nil Then l := nue
    Else ult^.sig := nue;
    ult := nue;
End;






{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del árbol a por niveles }

Procedure imprimirpornivel(a: arbol);

Var 
    l, aux, ult:   listaNivel;
    nivel, cant, i:   integer;
Begin
    l := Nil;
    If (a <> Nil)Then
        Begin
            nivel := 0;
            agregarAtras (l,ult,a);
            While (l<> Nil) Do
                Begin
                    nivel := nivel + 1;
                    cant := contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    For i:= 1 To cant Do
                        Begin
                            write (l^.info^.dato, ' - ');
                            If (l^.info^.HI <> Nil) Then agregarAtras (l,ult,l^.info^.HI);
                            If (l^.info^.HD <> Nil) Then agregarAtras (l,ult,l^.info^.HD);
                            aux := l;
                            l := l^.sig;
                            dispose (aux);
                        End;
                    writeln;
                End;
        End;
End;





{
ACTIVIDAD 1
 A) Implementar el módulo insertar  en un ABB de enteros
 B) Invocar al módulo insertar a partir de los elementos de la lista generada anteriormente.
 C) Invocar al módulo imprimirpornivel con el árbol generado en c).
 D) Graficar en papel el ABB y comprobar que los datos que se muestran en d) se corresponden con la estructura generada.

}

Procedure insertarRama (Var a: arbol; elemento: integer);
// toma un elemento y lo inserta en una rama de un arbol
Begin
    If (a = Nil) Then
        Begin
            new(a);
            a^.dato := elemento;
            a^.HD := Nil;
            a^.HI := Nil;
        End
    Else
        If (a^.dato > elemento) Then
            insertarRama(a^.HI, elemento)
    Else insertarRama(a^.HD, elemento);
End;

Procedure cargarArbol(l: lista; Var a: arbol);
Begin
    While (l<>Nil) Do
        Begin
            insertarRama(a,l^.dato);
            l := l^.sig;
        End;
End;





{
 Actividad 3
 A) Implementar el módulo preOrden que imprima los valores del ABB ya generado.
 B) Implementar el módulo enOrden que imprima los valores del ABB ya generado.
 C) Implementar el módulo postOrden que imprima los valores del ABB ya generado.
 D) Invocar cada uno de los módulos anteriores y comparar los resultados obtenidos.
}

Procedure preOrden( a: arbol );
Begin
    If ( a <> Nil ) Then
        Begin
            write (a^.dato, '   ');
            preOrden (a^.HI);
            preOrden (a^.HD);
        End;
End;

Procedure enOrden(a: arbol);
{Lo que hace el "enOrden" es buscar el mas chico y volver para atras en orden}
Begin
    If (a <> Nil) Then
        Begin
            enOrden(a^.HI);
            write (a^.dato, '   ');
            enOrden(a^.HD);
        End;
End;

Procedure postOrden(a: arbol);




{Lo mismo que enOrden pero al revez, se va pa la raiz, primero muestra el arbol derecho, despues el izquierdo
  esto lo va a ir cambiando segun corresponda, va a rrecorrer lo mas a la izquierda que puede despues mas a la derecha que puede, muestra valor, y repite}
Begin
    If (a<>Nil) Then
        Begin
            postOrden(a^.HD);
            write (a^.dato, '   ');
            postOrden(a^.HI);
        End;
End;





{
ACTIVIDAD 4
 A) Implementar el módulo buscar que reciba un árbol y un valor y devuelva un puntero al nodo donde se encuentra dicho valor. En caso de no encontrarlo, debe retornar nil.
 B) Invocar al módulo buscar con un valor que se ingresa de teclado. Mostrar el resultado de la búsqueda.
}

Function buscar(a:arbol; elemento: integer):   arbol;
Begin
    If (a=Nil) Then buscar := Nil
    Else If (a^.dato=elemento) Then buscar := a
    Else If (a^.dato>elemento) Then buscar := buscar(a^.HI,elemento)
    Else buscar := buscar(a^.HD,elemento);
End;





{
ACTIVIDAD 5
 A) Implementar el módulo verMin que reciba un árbol y devuelva el valor mínimo. En caso de recibir un árbol vacío, retornar -1.
 B) Implementar el módulo verMax que reciba un árbol y devuelva el valor máximo. En caso de recibir un árbol vacío, retornar -1.
 C) Invocar a los módulos generados en a) y b). Mostrar los resultados obtenidos.

}

Function verMin(a: arbol):   integer;

Const retERROR:   integer =   -1;

Var act:   integer;
Begin
    If (a = Nil) Then verMin := retERROR
    Else
        Begin
            act := verMin(a^.HI);
            If (act = retERROR) Then verMin := a^.dato
            Else verMin := act;
        End;
End;

Function verMax(a: arbol):   integer;

Const retERROR:   integer =   -1;

Var act:   integer;
Begin
    If (a = Nil) Then verMax := retERROR
    Else
        Begin
            act := verMax(a^.HD);
            If (act = retERROR) Then verMax := a^.dato
            Else verMax := act;
        End;
End;





{
ACTIVIDAD 7
 A) Generar un árbol de números enteros utilizando la lista ya creada.
 B) Mostrar el contenido del árbol en forma creciente.
 C) Implementar el módulo verValoresEnRango que reciba un árbol  y dos valores, que indiquen un rango, e informe los valores del árbol que se encuentren en dicho rango.
 D) Invocar al módulo verValoresEnRango con dos valores leídos de teclados.
}

Procedure verValoresEnRango(a:arbol; inf,sup:integer);
Begin
    If (a <> Nil) Then
        If (a^.dato >= inf) Then
            If (a^.dato <= sup) Then
                Begin
                    write(a^.dato, ' ');
                    verValoresEnRango(a^.hi, inf, sup);
                    verValoresEnRango(a^.hd, inf, sup);
                End
    Else
        verValoresEnRango(a^.hi, inf, sup)
    Else
        verValoresEnRango(a^.hd, inf, sup);
End;





{
 ACTIVIDAD 8
 A) Implementar el módulo borrarElemento que reciba un árbol y un valor a eliminar.
 B) Invocar al módulo borrarElemento con un valor que se ingresa de teclado.
 C) Invocar al módulo imprimirpornivel con el árbol resultante en el punto b).

}

Procedure borrarElemento(Var a:arbol; valor:integer; Var sePudoEliminar: boolean);
// REQUIERE UN {sePudoEliminar: boolean} EN DONDE SE LO INVOQUE
// REQUIERE verMin y verMax ya implementado

Var aux:   arbol;
Begin
    If (a = Nil) Then sePudoEliminar := false
    Else
        // caso: NO encontro el elemento
        If (a^.dato > valor) Then borrarElemento(a^.HI,valor,sePudoEliminar)

    Else If (a^.dato < valor) Then borrarElemento(a^.HD,valor,sePudoEliminar)

             // caso: Encontro el elemento
    Else
        Begin
            sePudoEliminar := true;
            If (a^.HI = Nil) And (a^.HD = Nil) Then dispose(a);
            // CASO NO TIENE HIJOS

            // subCaso (1 hijo solo): solo tiene hijo derecho
            If (a^.HI = Nil) And (a^.HD <> Nil) Then
                Begin
                    aux := a;
                    a := a^.HD;
                    dispose(aux);
                End

                // subCaso (1 hijo solo): solo tiene hijo izquierdo
            Else If (a^.HI <> Nil) And (a^.HD = Nil) Then
                     Begin
                         aux := a;
                         a := a^.HI;
                         dispose(aux);
                     End

                     // subCaso: tiene ambos hijos
            Else
                Begin
                    a^.dato := verMin(a^.HD);
                    borrarElemento(a^.HD, a^.dato, sePudoEliminar);
                End;

        End;
End;

{------------- Manejo de memoria -------------}
Procedure liberarMemLista(Var pri:lista);

Var 
    aux:   lista;
Begin
    While (pri<>Nil) Do
        Begin
            aux := pri;
            pri := pri^.sig;
            dispose(aux);
        End;
End;

Procedure liberarMemArbol(Var Al: arbol);
// GENERADO POR CHAT GPT

Var aux:   arbol;
Begin
    If (Al <> Nil) Then
        Begin
            LiberarMemArbol(Al^.HI);
            // Liberar subárbol izquierdo
            LiberarMemArbol(Al^.HD);
            // Liberar subárbol derecho
            aux := al;
            dispose(aux);
            // Liberar nodo actual
            al := Nil;
            // Asignar nil a la raíz para indicar que el árbol está vacío
        End;
End;

Var 

    l:   lista;
    a:   arbol;
    num, inf, sup, valEliminar:   integer;
    // actividad 4, numero a buscar
    res:   arbol;
    sePudoEliminar:   boolean;

Begin
    Randomize;
    a := Nil;

    crearLista(l);
    writeln ('Lista generada: ');
    imprimirLista(l);

    // ACTIVIDAD 1
    cargarArbol(l,a);
    writeln;
    writeln('Arbol generado:');
    imprimirpornivel(a);

    // ACTIVIDAD 3
    writeln('pre orden:');
    preOrden(a);
    writeln;
    writeln('en orden:');
    enOrden(a);
    writeln;
    writeln('post orden:');
    postOrden(a);
    writeln;

    // ACTIVIDAD 4
    writeln('Ingrese un numero a buscar en la lista: ');
    readln(num);
    res := buscar(a,num);
    If (res = Nil) Then writeln('Elemento no encontrado')
    Else writeln('numero ', res^.dato, ' encontrado');

    // ACTIVIDAD 5
    writeln('Valor minimo encontrado: ', verMin(a));
    writeln('Valor maximo encontrado: ', verMax(a));

    // ACTIVIDAD 7
    writeln('Ingrese un rango inferior: ');
    readln(inf);
    writeln('Ingrese un rango superior: ');
    readln(sup);
    writeln('Elementos en el rango [',inf,'-',sup,']:');
    verValoresEnRango(a,inf,sup);
    writeln;

    // ACTIVIDAD 8
    sePudoEliminar := false;
    writeln('Ingrese un valor a eliminar: ');
    readln(valEliminar);
    borrarElemento(a,valEliminar,sePudoEliminar);
    If sePudoEliminar Then Writeln(valEliminar, ' SI se pudo eliminar')
    Else writeln(valEliminar,' NO se pudo eliminar');
    writeln('Arbol generado:');
    imprimirpornivel(a);

    writeln('Fin del programa');
    readln;
    liberarMemLista(l);
    liberarMemArbol(a);
End.
