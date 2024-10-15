program actividad;
const
    FIN= 0000;
type
  venta= record
    codigo: integer;
    cantidad: integer;
    fecha: integer;
    cliente: integer;
  end;
  arbol= ^nodo;
  nodo= record
    dato: venta;
    HI,HD: arbol;
  end;

procedure CargarVenta (var v:venta);
begin
  with v do begin
     writeln(' Codigo: ');
     readln(codigo);
     if (codigo <> FIN) then begin
       cantidad:= random(100);
       fecha:= random(1000);
       cliente:= random(10000);
     end;
  end;
end;

procedure InsertarNodo (var a:arbol; v:venta);
begin
  if (a = nil) then begin
     new(a);
     a^.dato:= v;
     a^.HI:= nil;
     a^.HD:= nil;
     end else
         if (a^.dato.codigo > v.codigo) then
            InsertarNodo (a^.HI, v)
            else
            InsertarNodo (a^.HD, v);
end;

procedure CargarArbol (var a:arbol);
var
  v:venta;
begin
  CargarVenta(v);
  while (v.codigo <> FIN) do begin
    InsertarNodo(a,v);
    CargarVenta(v);
  end;
end;

procedure imprimirnodo (v:venta);
begin
  writeln('-------------------');
  writeln(' Codigo: ',v.codigo);
  writeln(' Cantidad: ',v.cantidad);
  writeln(' Fecha: ',v.fecha);
  writeln(' Nro. Cliente: ',v.cliente);
end;

Procedure enOrden (a:arbol);
begin
  if ( a <> nil ) then begin
    enOrden (a^.HI);
    imprimirnodo(a^.dato);
    enOrden (a^.HD);
  end;
end;

function verMinArbol(a: arbol): integer;
const
     ERROR:integer=-1;
var
     act: integer;
begin
     if (a = nil) then
        verMinArbol:= ERROR
	else begin
	act:= verMinArbol(a^.HI);
	if (act = ERROR) then verMinArbol:= a^.dato.cantidad
	   else verMinArbol:= act;
	   end;
end;
procedure procesarminimo (a:arbol; min:integer);
begin
    if ( a <> nil ) then begin
    procesarminimo (a^.HI,min);
    min:= verMinArbol(a);
    procesarminimo (a^.HD,min);
  end;
end;

// Programa Principal
var
  a: arbol;
  min: integer;

begin
  min:=9999;
  randomize;
  a:=nil;
  Cargararbol(a);
  writeln('Arbol generado');
  enOrden(a);
  procesarminimo(a,min);
  if (min = -1) then
     writeln('Arbol Vacio')
  else
      writeln;
      writeln('El nodo con la menor cantidad');
      imprimirnodo(a^.dato);
  readln;
end.

