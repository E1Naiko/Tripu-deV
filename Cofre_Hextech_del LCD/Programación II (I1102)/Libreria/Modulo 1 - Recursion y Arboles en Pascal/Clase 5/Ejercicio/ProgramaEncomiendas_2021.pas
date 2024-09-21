{
ACTIVIDAD 9
 A) Crear una estructura eficiente para la búsqueda,
	que almacene para cada peso, los códigos de
	encomienda registrados para el mismo.
 B) Imprimir a partir de la estructura generada,
	cada peso de encomienda con los códigos de
	encomienda registrados para dicho peso.
}

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

	// Arbol de listas simples
    arbol =   ^nodoA;
    nodoA =   Record
        dato:   lista;
        HI:   arbol;
        HD:   arbol;
    End;

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

procedure insertarEnRamaArbol(var a: arbol; elemento: encomienda); // toma un elemento y lo inserta en una rama de un arbol
	begin
		if (a = nil) then begin
					new(a);
					a^.dato:= nil;
					agregarAdelante(a^.dato, elemento);
					a^.HD:= nil;
					a^.HI:= nil;
		end else
			if (a^.dato^.dato.peso > elemento.peso) then
						insertarEnRamaArbol(a^.HI, elemento)
			else if (a^.dato^.dato.peso < elemento.peso) then
					insertarEnRamaArbol(a^.HD, elemento)
				else agregarAdelante(a^.dato, elemento);
	end;

procedure cargarArbol(var a: arbol; l: lista);
	begin
		while (l<>nil) do begin
			insertarEnRamaArbol(a, l^.dato);
			l:= l^.sig;
		end;
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

{-----------------------------------------------------------------------------
IMPRIMIRARBOL - Muestra en pantalla el arbol 1 }
procedure imprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			imprimirArbol(a^.HI);
			imprimirLista(a^.dato);
			imprimirArbol(a^.HD);
		end;
	end;

{-----------------------------------------------------------------------------
LIBERARMEM - libera la memmoria ocupada por la lista simple }
Procedure liberarMemLS(Var l:lista);

Var aux:   lista;
Begin
    While (l<>Nil) Do
        Begin
            aux := l;
            l := l^.sig;
            dispose(aux);
        End;
End;

{-----------------------------------------------------------------------------
LIBERARMEMARBOL - libera la memmoria ocupada por el arbol }
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
 a: arbol;
 l: lista;

begin
 Randomize;

 crearLista(l);
 writeln ('Lista de encomiendas generada: ');
 imprimirLista(l);
 
 cargarArbol(a,l);
 writeln('Arbol Generado');
 imprimirArbol(a);

 readln;
 liberarMemLS(l);
 liberarMemArbol(a);
end.
