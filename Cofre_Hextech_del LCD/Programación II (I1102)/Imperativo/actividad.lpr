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
var
  nue:arbol;
begin
  if (a = nil) then begin
     new(nue);
     nue^.dato:= v;
     nue^.HI:= nil;
     nue^.HD:= nil;
     end else
         if (a^.dato.codigo > v.codigo) then
            InsertarNodo (a^.HI, v)
            else
            If (a^.dato.codigo < v.codigo) then
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
  writeln(' Codigo: ',v.codigo);
  writeln(' Cantidad: ',v.cantidad);
  writeln(' Fecha: ',v.fecha);
  writeln(' Nro. Cliente: ',v.cliente);
end;

Procedure enOrden (a:arbol);
begin
  if ( a <> nil ) then begin
    imprimirnodo(a^.dato);
    enOrden (a^.HI);
    enOrden (a^.HD);
  end;
end;

procedure Buscarmin (a:arbol; min:venta);
var

begin

end;

// Programa Principal
var
  a:arbol;

begin
  randomize;
  a:=nil;
  Cargararbol(a);
  enOrden(a);
  readln;
end.

