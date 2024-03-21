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
 n := random (20)+10;
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
    preOrden (a^.HD);
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
  else if (a^.dato=elemento) then buscar:= a
                           else if (a^.dato>elemento) then buscar:= buscar(a^.HI,elemento)
                                                      else buscar:= buscar(a^.HD,elemento);
end;

{
ACTIVIDAD 5
 A) Implementar el módulo verMin que reciba un árbol y devuelva el valor mínimo. En caso de recibir un árbol vacío, retornar -1.
 B) Implementar el módulo verMax que reciba un árbol y devuelva el valor máximo. En caso de recibir un árbol vacío, retornar -1.
 C) Invocar a los módulos generados en a) y b). Mostrar los resultados obtenidos.

}

function verMin(a: arbol): integer;
const retERROR:integer=-1;
var act: integer;
begin
	if (a = nil) then verMin:= retERROR
		else begin
			act:= verMin(a^.HI);
			if (act = retERROR) then verMin:= a^.dato
				else verMin:= act;
		end;
end;

function verMax(a: arbol): integer;
const retERROR:integer=-1;
var act: integer;
begin
	if (a = nil) then verMax:= retERROR
		else begin
			act:= verMax(a^.HD);
			if (act = retERROR) then verMax:= a^.dato
				else verMax:= act;
		end;
end;

{
ACTIVIDAD 7
 A) Generar un árbol de números enteros utilizando la lista ya creada.
 B) Mostrar el contenido del árbol en forma creciente.
 C) Implementar el módulo verValoresEnRango que reciba un árbol  y dos valores, que indiquen un rango, e informe los valores del árbol que se encuentren en dicho rango.
 D) Invocar al módulo verValoresEnRango con dos valores leídos de teclados.
}

procedure verValoresEnRango(a:arbol; inf,sup:integer);
begin
  if (a <> nil) then
    if (a^.dato >= inf) then
      if (a^.dato <= sup) then begin
        write(a^.dato);
        verValoresEnRango(a^.hi, inf, sup);
        verValoresEnRango(a^.hd, inf, sup);
      end
      else
        verValoresEnRango(a^.hi, inf, sup)
    else
      verValoresEnRango(a^.hd, inf, sup);
end;

{
 ACTIVIDAD 8
 A) Implementar el módulo borrarElemento que reciba un árbol y un valor a eliminar.
 B) Invocar al módulo borrarElemento con un valor que se ingresa de teclado.
 C) Invocar al módulo imprimirpornivel con el árbol resultante en el punto b).

}

procedure borrarElemento(var a:arbol; valor:integer; var sePudoEliminar: boolean);
// REQUIERE UN {sePudoEliminar: boolean} EN DONDE SE LO INVOQUE
begin
  if (a<>nil) then
    // caso: NO encontro el elemento
    if (a^.dato > valor) then borrarElemento(a^.HI,valor,sePudoEliminar)
    else if (a^.dato < valor) then borrarElemento(a^.HD,valor,sePudoEliminar)

    // caso: Encontro el elemento
    else begin

      {Estrategia:
      Si el nodo tiene un hijo, el  nodo puede ser borrado después que su
      padre actualice el puntero al hijo del nodo que se quiere borrar.}

      // subCaso (1 hijo solo): solo tiene hijo derecho, busco el verMax
      if (a^.HI = nil) and (a^.HD <> nil) then begin

        end

         // subCaso (1 hijo solo): solo tiene hijo izquierdo, busco el verMin
         else if (a^.HI <> nil) and (a^.HD = nil) then

          // subCaso: tiene ambos hijos
           { Estrategia:
             1. Se busca el valor a borrar
             2. Se busca y selecciona  el hijo mas a la izquierda del
                subárbol derecho del nodo a borrar
                (o el hijo mas a la derecha del subárbol izquierdo).
             3. Se intercambia el valor del nodo encontrado por el que se quiere borrar
             4. Se llama al borrar a partir del hijo derecho con el valor del nodo encontrado. ¿Qué característica tiene ese nodo encontrado?
           }
          else
       sePudoEliminar:= true;
    end;
end;

{------------- Manejo de memoria -------------}
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
 a: arbol;
 num, inf, sup, valEliminar: integer; // actividad 4, numero a buscar
 res: arbol;
 sePudoEliminar: boolean;

begin
 Randomize;
 a:= nil;

 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);

 // ACTIVIDAD 1
 cargarArbol(l,a);
 writeln;
 writeln('Arbol generado:');
 imprimirpornivel(a);

 // ACTIVIDAD 3
 writeln('pre orden:'); preOrden(a); writeln;
 writeln('en orden:'); enOrden(a); writeln;
 writeln('post orden:'); postOrden(a); writeln;

 // ACTIVIDAD 4
 writeln('Ingrese un numero a buscar en la lista: '); readln(num);
 res:= buscar(a,num);
 if (res = nil) then writeln('Elemento no encontrado')
              else writeln('numero ', res^.dato, ' encontrado');

 // ACTIVIDAD 5
 writeln('Valor minimo encontrado: ', verMin(a));   
 writeln('Valor maximo encontrado: ', verMax(a));

 // ACTIVIDAD 7
 writeln('Ingrese un rango inferior: '); readln(inf);
 writeln('Ingrese un rango superior: '); readln(sup);
 writeln('Elementos en el rango [',inf,'-',sup,']:');
 verValoresEnRango(a,inf,sup);

 // ACTIVIDAD 8
 sePudoEliminar:= false;
 writeln('Ingrese un valor a eliminar: '); readln(valEliminar);
 borrarElemento(a,valEliminar,sePudoEliminar);
 if sePudoEliminar then Writeln(valEliminar, ' SI se pudo eliminar')
                   else writeln(valEliminar,' NO se pudo eliminar');
 writeln('Arbol generado:');
 imprimirpornivel(a);

 writeln('Fin del programa');
 readln;
 liberarMemLista(l);
 liberarMemArbol(a);
end.
