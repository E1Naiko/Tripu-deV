{

Enunciado 1
		Una empresa de micros de larga distancia gestiona sus ventas.
	Necesita almacenar la siguiente información para sus destinos
	de viaje: nombre del destino, distancia en kilómetros y la
	cantidad de pasajes vendidos para dicho destino.
	Dicha información se procesa hasta que se lee el destino “Fin”.

a.		Se nos pide diseñar una estructura eficiente de manera tal que
	por cada destino se almacene su distancia y la cantidad de pasajes
	vendidos para el mismo. La estructura generada debe ser la más
	eficiente en cuanto a la búsqueda de un destino. 

b.	Creen un programa que muestre un menú de opciones para:
	/*/ -	Inicializar las estructuras de datos a utilizar en su funcionamiento.
	/*/ -	Cargar un destino a la estructura utilizada.
	/*/ -	Imprimir la información contenida en la estructura de datos utilizada.
	/*/ -	Buscar un destino dentro de la estructura de datos utilizada y mostrar toda su información.
	/*/ -	Buscar e informar el destino más cercano.
	-	Sumar una cantidad X de pasajes a un destino.

Nota: Declarar todas las estructuras necesarias para el funcionamiento.
	  Modularizar el código en base a las funcionalidades pedidas. 
}

program ActividadColaborativa12;

uses crt, SysUtils;
const
	FIN= 'FIN';
	retERROR:integer= -1;
type
	tipoDestinos = record
		nombre: string;
		distancia: real;
		pasajesVendidos: integer;
	end;
	
	// Arbol de enteros
    arbol =   ^nodoA;
    nodoA =   Record
        dato:   tipoDestinos;
        HI:   arbol;
        HD:   arbol;
    End;

procedure insertarEnRamaArbol (var a: arbol; elemento: tipoDestinos); // toma un elemento y lo inserta en una rama de un arbol
begin
 if (a = nil) then begin
               new(a);
               a^.dato:= elemento;
               a^.HD:= nil;
               a^.HI:= nil;
   end else
     if (a^.dato.distancia > elemento.distancia) then insertarEnRamaArbol(a^.HI, elemento)
     else insertarEnRamaArbol(a^.HD, elemento)
end;

procedure leerDestino(var act: tipoDestinos; var terminar: boolean);
	begin
		with (act) do begin
			writeln('Insertar NOMBRE del Destino o ', FIN,' para terminar:'); readln(nombre);
			if (UpperCase(nombre)=FIN) then terminar:=true
			else begin
				writeln('Insertar DISTANCIA del Destino:'); readln(distancia);
				writeln('Insertar CANTIDAD DE PASAJES VENDIDOS del Destino:'); readln(pasajesVendidos);
			end;
		end;
	end;
	
procedure imprimirDestino(elemento: tipoDestinos);
	begin
		with elemento do begin
			writeln('Nombre del destino: ', nombre);
			writeln('Distancia del destino: ', distancia:2:2, 'km');
			writeln('Cantidad de pasajes vendidos: ', pasajesVendidos);
		end;
	end;

procedure imprimirArbol(a: arbol);
	begin
		if (a<>nil) then begin
			imprimirArbol(a^.HI);
			imprimirDestino(a^.dato);
			imprimirArbol(a^.HD);
		end;
	end;

procedure cargarArbol(var a: arbol);
	var
		termino: boolean;
		act: tipoDestinos;
    begin
		termino:= false;
		leerDestino(act, termino);
		while not(termino) do begin
			insertarEnRamaArbol(a, act);
			leerDestino(act, termino);
		end;
    end;
    
function buscarArbol(a:arbol; elemento: string): arbol;
	begin
		if (a = nil) then buscarArbol:= nil
		else if (a^.dato.nombre=elemento) then buscarArbol:= a
			else if (a^.dato.nombre>elemento) then buscarArbol:= buscarArbol(a^.HI,elemento)
			     else buscarArbol:= buscarArbol(a^.HD,elemento);
	end;
	
function verMinArbol(a: arbol): real;
    var act: real;
    begin
    	if (a = nil) then verMinArbol:= retERROR
    		else begin
    			act:= verMinArbol(a^.HI);
    			if (act = retERROR) then verMinArbol:= a^.dato.distancia
    				else verMinArbol:= act;
    		end;
    end;
    
procedure sumarDestinos(a: arbol);
	Procedure preOrden(a: arbol; aux: string; var cont: integer);
		begin
			if ( a <> nil ) then begin
				if (a^.dato.nombre = aux) then cont:= cont+1;
				preOrden (a^.HI, aux, cont);
				preOrden (a^.HD, aux, cont);
			end;
		end;
	var
		aux: string;
		cont: integer;
	begin
		cont:= 0;
		writeln('Introduzca nombre del destino:'); readln(aux);
		preOrden(a, aux, cont);
		writeln('Total encontrado: ', cont);
	end;

    
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

procedure MenuPrincipal(var A:arbol);
	procedure buscarDestino(a:arbol);
		var
			auxInp: string;
			auxPuntero: arbol;
		begin
			writeln('Insertar destino a buscar'); readln(auxInp);
			auxPuntero:= buscarArbol(a, auxInp);
			if (auxPuntero = nil) then writeln('Destino no encontrado')
								  else begin
									writeln('Destino encontrado');
									imprimirDestino(auxPuntero^.dato);
								end;
		end;
	var
		MainFin: boolean;
		inp: string;
	begin
		MainFin:= false;
		while not(MainFin) do begin
			clrscr;
			writeln('Funciones Disponibles: FIN, Inicializar, CargarNuevo, ImprimirDatos, BuscarDestino, DestinoMasCercano, SumaADestino');
			readln(inp);
			case (UpperCase(inp)) of
				'FIN': MainFin:= true;
				'INICIALIZAR': cargarArbol(a);
				'CARGARNUEVO': if (a = nil) then writeln('ERROR: ESTRUCTURA NO CARGADA')
										    else cargarArbol(a);
										    
				'IMPRIMIRDATOS': if (a = nil) then writeln('ERROR: ESTRUCTURA NO CARGADA')
										      else imprimirArbol(a);
										      
				'BUSCARDESTINO': if (a = nil) then writeln('ERROR: ESTRUCTURA NO CARGADA')
											  else BuscarDestino(a);
											  
				'DESTINOMASCERCANO': if (a = nil) then writeln('ERROR: ESTRUCTURA NO CARGADA')
												  else writeln(' - Distancia menor encontrada: ', verMinArbol(a):2:2);
												  
				'SUMAADESTINO': if (a = nil) then writeln('ERROR: ESTRUCTURA NO CARGADA')
											   else sumarDestinos(a);
				else writeln('Error Comando no encontrado');
			end;
			readln;
		end;
		
	end;

var a: arbol;    
BEGIN
	MenuPrincipal(a);
	liberarMemArbol(a);
END.
