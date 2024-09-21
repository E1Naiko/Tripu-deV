Program juegos;
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

        arboldisciplina = ^nodoarbol;
        nodoarbol = record
                dato: listaDisciplinas;
                HI,HD: arboldisciplina;
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
            d.pais:= Concat('Pais: ',IntToStr(aux))
        else
            if(aux<100)then
                d.pais:= Concat('Pais: ',IntToStr(aux))
	    else
                d.pais:= Concat('Pais: ',IntToStr(aux));
	d.codDisciplina:= random (299)+1;
	d.nombreDisciplina:= Concat('NombreDisciplina', IntToStr(d.codDisciplina));
	d.puesto:= random (3)+1;
	d.nombreAtleta:= Concat('Nombre de Atleta: ', IntToStr(random(5000)));
	agregarOrdenado(l,d);
	d.cod := random (100);
  end;
end;
procedure imprimir (d: disciplina);
begin
  writeln(' Codigo: ',d.cod, ' Codisciplina: ',d.codDisciplina);
  writeln(' ',d.nombreDisciplina, ' ',d.nombreAtleta);
  writeln(' ',d.pais, ' Puesto: ',d.puesto);
  writeln('-------------------------------------------------------------------');
end;

procedure imprimirlista2 (l:listaDisciplinas);
begin
  while (l<> nil) do begin
        writeln(' - Codigo de Disciplina: ',l^.dato.codDisciplina);
        writeln(' Nombre de la disciplina: ',l^.dato.nombreDisciplina, ' Codigo: ',l^.dato.cod);
        writeln(' Nombre de Atleta: ',l^.dato.nombreAtleta, ' Pais: ',l^.dato.Pais);
        writeln(' Puesto: ',l^.dato.puesto);
        l:= l^.sig;
  end;
end;

{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: listaDisciplinas);
begin
  while (l <> nil) do begin
   imprimir(l^.dato); //Completar el algoritmo para validar
   l:= l^.sig;
  end;
end;
{-----------------------------------------------------------------------------
AgregarNodo - Ordenado por codigo de disciplina}
procedure Agregarnodo (var a:arboldisciplina; d:disciplina);
begin
  if (a = nil) then begin
    new(a);
    a^.dato:= nil;
    agregarordenado(a^.dato,d);
    a^.HI:= nil;
    a^.HD:= nil;
    end
    else if (a^.dato^.dato.codDisciplina > d.codDisciplina) then
        Agregarnodo(a^.HI,d)
        else if( a^.dato^.dato.codDisciplina < d.codDisciplina) then
            Agregarnodo(a^.HD,d)
            else
                agregarordenado(a^.dato,d);
    end;

procedure Creararbol (var a:arboldisciplina; l:listadisciplinaS);
begin
  while(l<>nil) do begin
   Agregarnodo(a,l^.dato);
   l:=l^.sig;
  end;
end;

procedure enOrden (a:arboldisciplina);
begin
  if(a<>nil) then begin
    enOrden(a^.HI);
    imprimirlista2(a^.dato);
    enOrden(a^.HD);
  end;
end;
function contarAtletas(l:listadisciplinas): integer;
var
  aux: integer;
begin
  aux:=0;
  while (l <> nil) do begin
     aux:= aux+1;
     l:=l^.sig;
  end;
  contarAtletas:=aux;
end;

function busqueda (a:arboldisciplina; inf,sup:integer): integer;
begin
  if (a <> nil) then
     if (a^.dato^.dato.codDisciplina >=inf) then
       if (a^.dato^.dato.codDisciplina <=sup) then begin
         // A la invocacion actual del modulo le sumo sus 2 hijos
         busqueda:= busqueda(a^.HI,inf,sup) + busqueda(a^.HD,inf,sup) + contarAtletas(a^.dato);
       end else
           busqueda:= busqueda(a^.HI,inf,sup)
       else
               busqueda:= busqueda(a^.HD,inf,sup)
       // Si llego al final del arbol devuelvo 0
       else busqueda:= 0;

     end;

procedure Informaratleta (a:arboldisciplina);
var
  inf,sup: integer;
begin
  inf:= 100; sup:= 200;
  Writeln(busqueda(a,inf,sup),' atletas');
end;

var

 l: listaDisciplinas;
 a: arboldisciplina;

begin
 Randomize;

 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);
 creararbol(a,l);
 writeln;
 writeln(' Arbol Generado');
 enOrden(a);
 writeln(' Cantidad de atletas con codigo entre 100 y 200 ');
 Informaratleta(a);
 writeln(' Fin del programa');
 readln;
end.
