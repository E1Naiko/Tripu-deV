Program encomiendas;
Type

   encomienda = record
                  codigo: integer;
                  peso: integer;
                end;

  // Lista de encomiendas
  lista = ^nodoL;
  nodoL = record
    dato: encomienda;
    sig: lista;
  end;

  // Arbol de peso
  arbol = ^nodoA;
  nodoA = record
    dato: lista;
    HI,HD: arbol;
  end;


{-----------------------------------------------------------------------------
AgregarAdelante - Agrega una encomienda adelante en l}
procedure agregarAdelante(var l: Lista; enc: encomienda);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := enc;
  aux^.sig := l;
  l:= aux;
end;


{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con datos de las encomiendas }
procedure crearLista(var l: Lista);
var
  e: encomienda;
  i: integer;
begin
 l:= nil;
 for i:= 1 to 20 do begin
   e.codigo := i;
   e.peso:= random (10);
   while (e.peso = 0) do e.peso:= random (10);
   agregarAdelante(L, e);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   writeln('Codigo: ', l^.dato.codigo, '  Peso: ', l^.dato.peso);
   l:= l^.sig;
 End;
end;

{------------------------------------------------------
INSERTARNODO EN EL ARBOL }
procedure InsertarNodo (var a:arbol; e:encomienda);
begin
 if(a = nil) then begin
   new(a);
   a^.dato:= nil;
   agregarAdelante(a^.dato,e);
   a^.HI:= nil;
   a^.HD:= nil;
   end
   else if (a^.dato^.dato.peso > e.peso) then
           InsertarNodo(a^.HI,e)
           else if (a^.dato^.dato.peso < e.peso) then
           InsertarNodo(a^.HD,e)
           else
             agregarAdelante(a^.dato,e);
 end;

procedure Creararbol(var a:arbol; l:lista);
begin
 while (l<>nil) do begin
   InsertarNodo(a,l^.dato);
   l:= l^.sig;
 end;
end;

procedure enOrden (a:arbol);
begin
 if(a <> nil) then begin
   enOrden(a^.HI);
   writeln('Peso ',a^.dato^.dato.peso);
   while (a^.dato <> nil) do begin
     writeln('Codigo: ',a^.dato^.dato.codigo);
     a^.dato:= a^.dato^.sig;
   end;
   writeln('-------------------');
   enOrden(a^.HD);
 end;
end;

Var

 l: lista;
 a:arbol;

begin
 Randomize;
 a:= nil;
 crearLista(l);
 writeln ('Lista de encomiendas generada: ');
 imprimirLista(l);
 Creararbol(a,l);
 writeln('-------------------------');
 writeln('Arbol generado:');
 writeln('-------------------------');
 enOrden(a);
 readln;
end.

