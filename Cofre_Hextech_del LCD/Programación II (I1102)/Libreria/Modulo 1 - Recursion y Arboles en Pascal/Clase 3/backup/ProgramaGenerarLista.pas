Program ProgramaGenerarArbol;
const
  absurdo=99999;
Type

  // Lista de enteros
  lista = ^nodoL;
  nodoL = record
    dato: integer;
    sig: lista;
  end;

  // Arbol de enteros
  arbol= ^nodoA;
  nodoA = Record
    dato: integer;
    HI: arbol;
    HD: arbol;
  End;

  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = record
    info: arbol;
    sig: listaNivel;
  end;


{-----------------------------------------------------------------------------
AgregarAdelante - Agrega nro adelante de l}
procedure agregarAdelante(var l: Lista; nro: integer);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := nro;
  aux^.sig := l;
  l:= aux;
end;



{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con números aleatorios }
procedure crearLista(var l: Lista);
var
  n: integer;
begin
 l:= nil;
 n := random (20);
 While (n <> 0) do Begin
   agregarAdelante(L, n);
   n := random (20);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   write(l^.dato, ' - ');
   l:= l^.sig;
 End;
end;

{-----------------------------------------------------------------------------
CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

function ContarElementos (l: listaNivel): integer;
  var c: integer;
begin
 c:= 0;
 While (l <> nil) do begin
   c:= c+1;
   l:= l^.sig;
 End;
 contarElementos := c;
end;


{-----------------------------------------------------------------------------
AGREGARATRAS - Agrega un elemento atrás en l}

Procedure AgregarAtras (var l, ult: listaNivel; a:arbol);
 var nue:listaNivel;

 begin
 new (nue);
 nue^.info := a;
 nue^.sig := nil;
 if l= nil then l:= nue
           else ult^.sig:= nue;
 ult:= nue;
 end;


{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del árbol a por niveles }

Procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    cant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to cant do begin
                      write (l^.info^.dato, ' - ');
                      if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                      if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                      aux:= l;
                      l:= l^.sig;
                      dispose (aux);
                     end;
                     writeln;
                 end;
               end;
end;

{
ACTIVIDAD 1
 A) Implementar el módulo insertar  en un ABB de enteros
 B) Invocar al módulo insertar a partir de los elementos de la lista generada anteriormente.
 C) Invocar al módulo imprimirpornivel con el árbol generado en c).
 D) Graficar en papel el ABB y comprobar que los datos que se muestran en d) se corresponden con la estructura generada.

}

procedure insertarRama (var a: arbol; elemento: integer); // toma un elemento y lo inserta en una rama de un arbol
begin
 if (a = nil) then begin
               new(a);
               a^.dato:= elemento;
               a^.HD:= nil;
               a^.HI:= nil;
   end else
     if (a^.dato > elemento) then
                 insertarRama(a^.HI, elemento)
     else insertarRama(a^.HD, elemento);
end;

procedure cargarArbol(l: lista; var a: arbol);
begin
  while (l<>nil) do begin
    insertarRama(a,l^.dato);
    l:=l^.sig;
  end;
end;

{
 Actividad 3
 A) Implementar el módulo preOrden que imprima los valores del ABB ya generado.
 B) Implementar el módulo enOrden que imprima los valores del ABB ya generado.
 C) Implementar el módulo postOrden que imprima los valores del ABB ya generado.
 D) Invocar cada uno de los módulos anteriores y comparar los resultados obtenidos.
}

Procedure preOrden( a: arbol );
begin
  if ( a <> nil ) then begin
    write (a^.dato, '   ');
    preOrden (a^.HI);
    preOrden (a^.HD)
  end;
end;

procedure enOrden(a: arbol);
{Lo que hace el "enOrden" es buscar el mas chico y volver para atras en orden}
begin
  if (a <> nil) then begin
    enOrden(a^.HI);
    write (a^.dato, '   ');
    enOrden(a^.HD);
  end;
end;

procedure postOrden(a: arbol);
{Lo mismo que enOrden pero al revez, se va pa la raiz, primero muestra el arbol derecho, despues el izquierdo
esto lo va a ir cambiando segun corresponda, va a rrecorrer lo mas a la izquierda que puede despues mas a la derecha que puede, muestra valor, y repite}
begin
     if (a<>nil) then begin
       postOrden(a^.HD);
       write (a^.dato, '   ');
       postOrden(a^.HI);
     end;
end;

{
ACTIVIDAD 4
 A) Implementar el módulo buscar que reciba un árbol y un valor y devuelva un puntero al nodo donde se encuentra dicho valor. En caso de no encontrarlo, debe retornar nil.
 B) Invocar al módulo buscar con un valor que se ingresa de teclado. Mostrar el resultado de la búsqueda.
}

function buscar(a:arbol; elemento: integer): arbol;
begin
  if (a=nil) then buscar:=nil
  else if (a^.dato=elemento) then buscar:=a
                           else if (a^.dato>elemento) then buscar:= buscar(a^.HI,elemento)
                                                      else buscar:= buscar(a^.HD,elemento);
end;

procedure liberarMemLista(var pri:lista);
    var
        aux: lista;
    begin
        while (pri<>nil) do begin
            aux:= pri;
            pri:= pri^.sig;
            dispose(aux);
        end;
    end;

procedure liberarMemArbol(var Al: arbol);  // GENERADO POR CHAT GPT
var aux: arbol;
begin
  if (Al <> nil) then begin
    LiberarMemArbol(Al^.HI); // Liberar subárbol izquierdo
    LiberarMemArbol(Al^.HD); // Liberar subárbol derecho
    aux:= al;
    dispose(aux); // Liberar nodo actual
    al := nil; // Asignar nil a la raíz para indicar que el árbol está vacío
  end;
end;

Var

 l: lista;
 al: arbol;
 num: integer; // actividad 4, numero a buscar
 res: arbol;

begin
 Randomize;
 al:=nil;

 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);

 cargarArbol(l,al);
 writeln;
 writeln('Arbol generado:');
 imprimirpornivel(al);

 writeln('pre orden:'); preOrden(al); writeln;
 writeln('en orden:'); enOrden(al); writeln;
 writeln('post orden:'); postOrden(al); writeln;

 writeln('Ingrese un numero a buscar en la lista: '); readln(num);
 res:= buscar(al,num);
 if (res=nil) then writeln('Elemento no encontrado')
              else writeln('numero ', res^.dato, ' encontrado');

 readln;
 liberarMemLista(l);
 liberarMemArbol(al);
end.
