program Project6;
const
  FIN = 0;
type
  libro = record
    titulo: string;
    isbn: integer;
    clasificador: string;
  end;

  arbol= ^nodo;
  nodo = record
    dato: libro;
    HI,HD: arbol;
    end;

procedure CargarLibro(var l:libro);
begin
  with l do begin
    writeln('Isbn: ');
    readln(isbn);
    if (isbn <> FIN) then begin
       writeln('Titulo: ');
       readln(titulo);
       writeln('Clasificación: ');
       readln(clasificador);
    end;
  end;
end;

procedure AgregarNodo (var a:arbol; l:libro);
begin
  if (a = nil) then begin
    new(a);
    a^.dato:= l;
    a^.HI:= nil;
    a^.HD:= nil;
    end else
        if(a^.dato.isbn > l.isbn) then
                        AgregarNodo(a^.HI,l)
                        else
                          AgregarNodo(a^.HD,l);
    end;

procedure Crearbol (var a:arbol);
var
  l: libro;
begin
    CargarLibro(l);
    while(l.isbn <> FIN) do begin
         AgregarNodo(a,l);
         CargarLibro(l);
    end;
end;

procedure ImprimirNodo (l:libro);
begin
  writeln('Titulo: ',l.titulo,' Isbn: ',l.isbn, ' Clasificacion: ',l.clasificador);
end;

procedure Enorden (a:arbol);
begin
  if( a <> nil) then begin
    Enorden(a^.HI);
    ImprimirNodo(a^.dato);
    Enorden(a^.HD);
    end;
end;

function ExisteLibro (a:arbol; i:integer):boolean;
begin
  if(a=nil) then
                  ExisteLibro:= false
  else if (a^.dato.isbn = i) then
                  ExisteLibro:= true
                  else if (a^.dato.isbn > i) then
                                  Existelibro:= ExisteLibro(a^.HI,i)
                                  else
                                    ExisteLibro:= ExisteLibro(a^.HD,i);
end;

procedure BuscarLibro(a:arbol);
var
  i: integer;
  begin
    readln(i);
    if(ExisteLibro(a,i)) then
                    writeln(' Libro encontrado')
                    else
                      writeln(' No existe libro');

  end;

var
  a: arbol;
begin
  a:= nil;
  Crearbol(a);
  writeln('Arbol Generado');
  Enorden(a);
  writeln('Buscar un libro por isbn: ');
  BuscarLibro(a);
  readln;
end.

