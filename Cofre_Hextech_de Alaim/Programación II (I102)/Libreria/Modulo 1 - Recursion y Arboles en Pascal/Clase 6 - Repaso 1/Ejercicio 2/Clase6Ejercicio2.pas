{
   Una aerolínea quiere premiar a sus mejores clientes y para ello, lee
   */ la información de los pasajes que ha vendido. De cada venta se
   */ conoce un código de vuelo (alfanumérico, ej: AR1620), cantidad de
   */ millas recorridas, DNI del pasajero, su nombre y apellido y la
   */ clase en que solicitó el boleto. Esta información se lee ordenada
   */ por código de vuelo.

█	Se necesita saber qué cantidad de puntos acumularon los pasajeros
	*/ de la siguiente manera: cada pasajero que haya viajado en clase
	*/ ejecutiva suma 100 puntos por milla de vuelo, mientras que
	*/ aquellos que viajaron en clase turista suman 25 puntos por milla. 

Por lo que se pide: 
█	Generar una estructura que almacene para cada pasajero su DNI,
*/ nombre y apellido y los puntajes acumulados por cada código de vuelo,
*/ de manera tal que resulte eficiente la búsqueda por DNI del pasajero. 

Al finalizar el procesamiento de a): 

█ A) Escriba un módulo que devuelva el mayor puntaje total (sumando todos
*/ sus vuelos) para dar el premio al mejor cliente.
 
B) Escriba un módulo que imprima el mayor puntaje (entre sus vuelos) de
*/ los pasajeros cuyo DNI se encuentre entre 40.000.000 y 50.000.000.

C) Realizar un programa que simule el llamado a los módulos b) y c), e
*/ informe lo devuelto por c).
   
}


program Clase6Ejercicio2;

uses crt, SysUtils;
const fin = 'FIN000';
type
	
	strNoms = string [40];
	tipoPasajero = record
		nombre, apellido: strNoms;
		millasTot: real;
	end;
	
	tipoVuelo = record
		codigo, clase: string; // PARAMETRO DE ORDEN
		millasRecorridas: real; 
	end;
	
	tipoLista = ^nodoLS;
	nodoLS = record
		dato: tipoVuelo;
		sig: tipoLista;
	end;
	
	// Arbol de pasajeros
    arbol =   ^nodoA;
    nodoA =   Record
		DNI: longint; // ORDEN DEL ARBOL
        pasajero: tipoPasajero;
		lista : tipoLista;
        HI:   arbol;
        HD:   arbol;
    End;
    
    
    
procedure leerActual(var DNI: longint; var pasajero: tipoPasajero; var vuelo: tipoVuelo);
	begin
		writeln(' - Codigo de Vuelo:'); readln(vuelo.codigo);
		vuelo.codigo:= UpperCase(vuelo.codigo);
		if (vuelo.codigo <> fin) then begin
		    vuelo.millasRecorridas:= 0;
			writeln(' -- Millas recorridas:'); readln(vuelo.millasRecorridas);
			writeln(' -- Clase'); readln(vuelo.clase);
			vuelo.clase:= UpperCase(vuelo.clase);
			
			// ACTUALIZO LOS VALORES DE MILLA
			if (vuelo.clase = 'EJECUTIVA') then
				vuelo.millasRecorridas:= vuelo.millasRecorridas + 100
			else if (vuelo.clase = 'TURISTA') then
				vuelo.millasRecorridas:= vuelo.millasRecorridas + 25*(vuelo.millasRecorridas);
			pasajero.millasTot:= vuelo.millasRecorridas;
			writeln(' -- DNI:'); readln(DNI);
			writeln(' -- Nombre:'); readln(pasajero.nombre);
			writeln(' -- Apellido:'); readln(pasajero.apellido);
		end;
	end;



Procedure agregarInicioLS(var l: tipoLista; elemento: tipoVuelo);
   var
      aux: tipoLista;
   begin
        new(aux);
        aux^.dato := elemento;
        aux^.sig := l;
        l:= aux;
   end;
    
    
    
procedure insertarEnRamaArbolDeListas(var a: arbol; DNI: longint; pasajero: tipoPasajero; vuelo: tipoVuelo);
// toma un elemento y lo inserta en una rama de un arbol
	begin
		if (a = nil) then begin
					new(a);
					a^.DNI:= DNI;
					a^.pasajero:= pasajero;
					agregarInicioLS(a^.lista, vuelo);
					a^.HD:= nil;
					a^.HI:= nil;
		end else
			if (a^.DNI > DNI) then
						insertarEnRamaArbolDeListas(a^.HI, DNI, pasajero, vuelo)
			else if (a^.DNI < DNI) then
					insertarEnRamaArbolDeListas(a^.HD, DNI, pasajero, vuelo)
				else begin
					a^.pasajero.millasTot:= a^.pasajero.millasTot + vuelo.millasRecorridas;
					agregarInicioLS(a^.lista, vuelo);
				end;
	end;
	
	

procedure cargarArbolLS(var a: arbol);
	var
		DNI: longint;
		pasajero: tipoPasajero;
		vuelo: tipoVuelo;
	begin
		leerActual(DNI,pasajero, vuelo);
		while (vuelo.codigo <> fin) do begin
			insertarEnRamaArbolDeListas(a, DNI, pasajero, vuelo);
			leerActual(DNI, pasajero, vuelo);
		end;
	end;
	
	

procedure imprimirRamaLS(a: arbol);
   var
   	  aux: tipoLista;
	  cont: integer;
   begin
		if (a <> nil) then begin
			cont:= 1;
			writeln(' DNI :', a^.DNI);
			with a^.pasajero do begin
				writeln(' -- Nombre: ', nombre);
				writeln(' -- Apellido: ', apellido);
				writeln(' -- Millas Totales: ', millasTot:2:2);
				aux:= a^.lista;
				while (aux <> nil) do begin
					with aux^.dato do begin
						writeln(' -- Vuelo  ', cont, ':');
						writeln(' ---- Codigo: ', codigo);
						writeln(' ---- Clase: ', clase);
						writeln(' ---- Millas Recorridas: ', millasRecorridas:2:2);
					end;
					cont:= cont + 1;
					aux:= aux^.sig;
				end;
			end;
   	  end;
   end;



procedure enOrden(a: arbol);
   begin
     // DE MENOR A MAYOR
     if (a <> nil) then begin
       enOrden(a^.HI);
       imprimirRamaLS(a);
       enOrden(a^.HD);
     end;
   end;
   
   
   
   {A) Escriba un módulo que devuelva el mayor puntaje total (sumando 
	*/ todos sus vuelos) para dar el premio al mejor cliente.}
procedure mayorMillaje(a: arbol; var res: real);
	begin
		if (a <> nil) then begin
			mayorMillaje(a^.HI,res);
			mayorMillaje(a^.HD,res);
			if (a^.pasajero.millasTot > res) then res:= a^.pasajero.millasTot;
		end;
	end;
	
	

Procedure busquedaAcotadaArbol(a: arbol; inf:real; sup:real); 
	var res: real;
   begin
     if (a <> nil) then
       if (a^.DNI >= inf) then
         if (a^.DNI <= sup) then mayorMillaje(a, res)
         else busquedaAcotadaArbol(a^.hi, inf, sup)
       else busquedaAcotadaArbol(a^.hd, inf, sup)
     else Writeln('ERROR - No Hay elementos dentro del rango');
   end;
   
   
   	
Procedure liberarMemArbolLS(Var Al: arbol);
    Var
		aux:   arbol;
		aux2: tipoLista;
    Begin
        If (Al <> Nil) Then
            Begin
                LiberarMemArbolLS(Al^.HI);
                // Liberar subárbol izquierdo
                LiberarMemArbolLS(Al^.HD);
                // Liberar subárbol derecho
                aux := al;
                while al^.lista<>nil do begin
					aux2:= al^.lista;
					al^.lista:=al^.lista^.sig;
					dispose(aux2);
                end;
                dispose(aux);
                // Liberar nodo actual
                al := Nil;
                // Asignar nil a la raíz para indicar que el árbol está vacío
            End;
    End;



var
	a: arbol;
	res: real;
BEGIN
	a:= nil;
	
	cargarArbolLS(a);
	enOrden(a);
	
	writeln;
	
	if (a = nil) then
					writeln('ERROR - La Estructura no fue cargada, no es posible encontrar un millaje maximo')
			   else begin
					mayorMillaje(a, res);
					writeln('El mayor millaje encontrado fue ', res);
				end;
	busquedaAcotadaArbol(a, 40000000, 50000000);
	
	readln;
	liberarMemArbolLS(a);
END.

