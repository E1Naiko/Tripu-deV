{


	Contexto

	Se leen desde teclado los datos correspondientes a pacientes que
dieron positivo al examen de COVID-19 en Argentina. De cada uno de
ellos se conoce: DNI, Código postal y nombre de la ciudad donde vive. 

	Ejercicio 1: Con la información anterior, se quiere armar un mapa
en el que aparezca por cada ciudad, la cantidad total de habitantes
infectados.

Este mapa debe estar ordenado por código postal para que la búsqueda
por dicho criterio sea eficiente.

    a) Implementen el mapa de información.
    b) Implementen un módulo que informe la cantidad de infectados de
    aquellas localidades que tienen código postal entre 1800 y 1900.


   
}


program actividadColaborativa2;

const FINCODIGOPOSTAL = 0;
type
	tipoPaciente = record
		dni, codigoPostal: integer;
		ciudad: string;
	end;
	
	lista = ^nodo;
    nodo = record
        datos: tipoPaciente;
        sig: lista;
    end;
    Tlista = record
        pri, ult: lista;
    end;
    
    arbol =   ^nodoA;
    nodoA =   Record
        dato:   Tlista;
        cantPacientes:   integer;
        HI:   arbol;
        HD:   arbol;
    End;



{--------------------------- MANEJO DE REGISTROS ---------------------------}	



procedure leerPaciente(var act: tipoPaciente);
// lee pacientes hasta leer el codigo postal FINCODIGOPOSTAL
	begin
		with act do begin
			writeln('Codigo Postal, ingrese ', FINCODIGOPOSTAL,' para terminar: '); readln(codigoPostal);
			if (codigoPostal <> FINCODIGOPOSTAL) then begin
				writeln(' DNI del Paciente: '); readln(DNI);
				writeln(' Nombre de la ciudad: '); readln(ciudad);
			end;
		end;
		
	end;


{--------------------------- MANEJO DE LA LISTA ---------------------------}



Procedure agregarFinalLS(Var l: Tlista; elem: tipoPaciente);
	Var nue:   lista;
	Begin
		new(nue);
		nue^.datos := elem;
		nue^.sig := Nil;
	
		If (l.pri = Nil) Then l.pri := nue
		Else l.ult^.sig := nue;
		l.ult := nue;
	End;
	
	

Procedure imprimirLista(l: lista);
	
	Begin
		While (l <> Nil) Do
			Begin
				with l^.datos do
					writeln(' - DNI:', dni, ' - Codigo Postal: ', codigoPostal, ' - Ciudad: ', ciudad, ' -');
				l := l^.sig;
			End;
	End;



{--------------------------- MANEJO DEL ARBOL ---------------------------}



procedure insertarEnRamaArbolDeListas(var a: arbol; elemento: tipoPaciente);
// toma un elemento y lo inserta en una rama de un arbol
	begin
		if (a = nil) then begin
					new(a);
					a^.dato.pri:= nil;
					a^.dato.ult:= nil;
					a^.cantPacientes:= 1;
					agregarFinalLS(a^.dato, elemento);
					a^.HD:= nil;
					a^.HI:= nil;
		end else
			if (a^.dato.pri^.datos.codigoPostal > elemento.codigoPostal) then
						insertarEnRamaArbolDeListas(a^.HI, elemento)
			else if (a^.dato.pri^.datos.codigoPostal < elemento.codigoPostal) then
					insertarEnRamaArbolDeListas(a^.HD, elemento)
				else begin
					agregarFinalLS(a^.dato, elemento);
					a^.cantPacientes:= a^.cantPacientes + 1;
				end;
	end;



procedure cargarArbol(var a: arbol);
	var aux: tipoPaciente;
	begin
		leerPaciente(aux);
		while (aux.codigoPostal <> FINCODIGOPOSTAL) do begin
			insertarEnRamaArbolDeListas(a,aux);
			leerPaciente(aux);
		end;
	end;



procedure enOrden(a: arbol);
	begin
		if (a <> nil) then begin
			enOrden(a^.HI);
			imprimirLista(a^.dato.pri);
			enOrden(a^.HD);
		end;
	end;



function busquedaAcotadaArbol(a: arbol; inf:integer; sup:integer): integer; 
	begin
		if (a <> nil) then
			if (a^.dato.pri^.datos.codigoPostal >= inf) then
				if (a^.dato.pri^.datos.codigoPostal <= sup) then begin
					
					busquedaAcotadaArbol:= busquedaAcotadaArbol(a^.hi, inf, sup) + busquedaAcotadaArbol(a^.hd, inf, sup) + a^.cantPacientes;
				
				end else
					busquedaAcotadaArbol:= busquedaAcotadaArbol(a^.hi, inf, sup)
			else
				busquedaAcotadaArbol:= busquedaAcotadaArbol(a^.hd, inf, sup)
		else busquedaAcotadaArbol:= 0;
	end;
	
	
	
{--------------------------- MANEJO DE MEMORIA ---------------------------}	



Procedure liberarMem(Var l:lista);
	Var aux:   lista;
	Begin
		While (l<>Nil) Do
			Begin
				aux := l;
				l := l^.sig;
				dispose(aux);
			End;
	End;



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
                
                liberarMem(al^.dato.pri);
                dispose(aux);
                // Liberar nodo actual
                al := Nil;
                // Asignar nil a la raíz para indicar que el árbol está vacío
            End;
    End;



{--------------------------- PROGRAMA PRINCIPAL ---------------------------}



var a: arbol;

BEGIN
	a:= nil;
	cargarArbol(a);
	
	enOrden(a);
	writeln('Cantidad de Pacientes con codigos postales entre 1800 y 1900: ', busquedaAcotadaArbol(a, 1800, 1900));
	
	readln;
	liberarMemArbol(a)
END.

