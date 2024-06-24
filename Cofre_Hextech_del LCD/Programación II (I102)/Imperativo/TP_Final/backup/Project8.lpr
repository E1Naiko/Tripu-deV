Program Project8;
Uses
	sysutils;
Type
	sub = 1..4;

	disciplina = record
		cod: integer;
		codDisciplina: integer;
		nombreDisciplina: string;
		puesto: sub;
		nombreAtleta: string;
		pais: string;
	end;

	listaDisciplinas = ^nodoLista;
	nodoLista = record
		dato: disciplina;
		sig: listaDisciplinas;
	end;

        listapais = ^nodoPais;
        nodoPais = record
                pais:string;
                sig:listapais;
        end;

        arbol = ^nodoDisciplina;
        nodoDisciplina= record
                cod: integer;
                nombre: string;
                total: integer;
                paises: listapais;
                HI,HD: arbol;
        end;

        listaNombre = ^nodo;
        nodo= record
                nombre: string;
                sig:listaNombre;
        end;

{-----------------------------------------------------------------------------
AgregarOrdenado - Agrega ordenado en l}
Procedure agregarOrdenado(var l: listaDisciplinas; d: disciplina);
var
   nuevo, anterior, actual: listaDisciplinas;
begin
	new (nuevo);
	nuevo^.dato:= d;
	nuevo^.sig := nil;
	actual := l;
	anterior := l;
	while (actual<>nil) and (actual^.dato.pais < nuevo^.dato.pais) do begin
	   anterior := actual;
	   actual:= actual^.sig;
	end;
	if (anterior = actual) then
	   l := nuevo
	else
	   anterior^.sig := nuevo;
	nuevo^.sig := actual;
end;

{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista }
procedure crearLista(var l: listaDisciplinas);
var
  aux: integer;
  d: disciplina;
begin
  l:= nil;
  d.cod := random (100);

  while (d.cod <> 0) do Begin
        aux:=random(193)+1;
        if(aux<10)then
            d.pais:= Concat('Pais00',IntToStr(aux))
        else
            if(aux<100)then
                d.pais:= Concat('Pais0',IntToStr(aux))
	    else
                d.pais:= Concat('Pais',IntToStr(aux));
	d.codDisciplina:= random (299)+1;
	d.nombreDisciplina:= Concat('Disciplina', IntToStr(d.codDisciplina));
	d.puesto:= random (3)+1;
	d.nombreAtleta:= Concat('Atleta', IntToStr(random(5000)));
	agregarOrdenado(l,d);
	d.cod := random (100);
  end;
end;

procedure imprimir(d:disciplina);
begin
  with d do begin
        writeln('Codigo: ',cod,' Codigo Disciplina: ',codDisciplina);
	writeln('Nombre Disciplina: ',nombreDisciplina,' Puesto: ',puesto);
	writeln('Nombre Atleta: ',nombreAtleta, ' Pais: ',pais);
  end;
end;

{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: listaDisciplinas);
begin
  while (l <> nil) do begin
  writeln('------------------------------');
   imprimir(l^.dato); //Completar el algoritmo para validar
   l:= l^.sig;
  end;
end;

procedure AgregarAdelante (var l:listaPais; p:string);
var
  nue:listaPais;
begin
  new(nue);
  nue^.pais:= p;
  nue^.sig:= l;
  l:= nue;
end;

procedure AgregarNodo(var a:arbol; d:disciplina);
begin
  if (a = nil) then begin
     new(a);
    a^.cod:= d.cod;
    a^.nombre:=d.nombreDisciplina;
    a^.total:= 1;
    a^.paises:= nil;
    AgregarAdelante(a^.paises,d.pais);
    a^.HI:= nil;
    a^.HD:= nil;
    end else
        if (a^.cod > d.cod) then
	   AgregarNodo(a^.HI, d)
	   else if (a^.cod < d.cod) then
	        AgregarNodo(a^.HD, d)
		else begin
                     AgregarAdelante(a^.paises,d.pais);
                     a^.total:= a^.total + 1;
                     end;
end;

procedure Crearbol (var a:arbol; l:listaDisciplinas);
begin
  a:= nil;
  while (l <> nil) do begin
        AgregarNodo(a,l^.dato);
        l:= l^.sig;
  end;
end;
procedure ImprimirLista (l:listaPais);
begin
  while(l <> nil) do begin
        write(' | ',l^.pais);
        l:= l^.sig;
  end;
end;

procedure ImprimirNodo(a:arbol);
begin
  Writeln(' Codigo: ',a^.cod,' Nombre: ',a^.nombre, ' Total: ',a^.total);
  writeln('Paises: ');
  ImprimirLista(a^.paises);
  writeln;
end;

procedure ImprimirArbol (a:arbol);
begin
  if(a<>nil) then begin
       ImprimirArbol(a^.HI);
       ImprimirNodo(a);
       ImprimirArbol(a^.HD);
  end;
end;

procedure CantidadAtletas (a:arbol; inf,sup:integer; var cant:integer);
begin
  if (a <> nil) then
    if (a^.cod >= inf) then
      if (a^.cod <= sup) then begin
        cant:= cant + a^.total;
        CantidadAtletas(a^.hi, inf, sup,cant);
        CantidadAtletas(a^.hd, inf, sup,cant);
      end
      else
        CantidadAtletas(a^.hi, inf, sup,cant)
    else
      CantidadAtletas(a^.hd, inf, sup,cant);
end;

procedure InformarCantidad (a:arbol);
var
  cant:integer;
begin
  cant:=0;
  CantidadAtletas(a,10,20,cant);
  writeln(cant,' Atletas');
end;

procedure AgregarNombre (var l:listaNombre; nom:string);
var
  nue:listaNombre;
begin
  new(nue);
  nue^.nombre:= nom;
  nue^.sig:= l;
  l:= nue;
end;

procedure BusquedaNombre (a:arbol; inf,sup:integer; var l:listaNombre);
begin
  if (a <> nil) then begin
    if (a^.total >= inf) and (a^.total <= sup) then
        AgregarNombre(l,a^.nombre);
    BusquedaNombre(a^.HI, inf, sup,l);
    BusquedaNombre(a^.HD, inf, sup,l);
  end;
end;

procedure Imprimirlista(l:listaNombre);
begin
  while(l <> nil) do begin
        write(' | ',l^.nombre);
        l:=l^.sig;
  end;
end;

procedure InformarNombres (a:arbol);
var
  l:listaNombre;
begin
  l:= nil;
  busquedaNombre(a,2,5,l);
  writeln(' Nombres de las disciplinas que contiene entre 2 y 5 atletas participantes: ');
  Imprimirlista(l);
end;

Var

 l: listaDisciplinas;
 a: arbol;

begin
 Randomize;

 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);
 crearbol(a,l);
 writeln ('Arbol Generado: ');
 ImprimirArbol(a);
 writeln('Cantidad de atletas de las disciplina entre 10 y 20');
 InformarCantidad(a);
 InformarNombres(a);
 writeln;
 writeln ('Fin del programa');
 readln;
end.
