{
Enunciado 2
	Una casa de venta de pastas frescas lee la información de las ventas que se realizaron durante un determinado mes.
	De cada venta se conoce: el código de pasta, cantidad (en kilos), fecha y número de cliente.
	Dicha información se procesa hasta que se lee el número de cliente “0000”.

    a. Se nos pide generar de forma eficiente, una estructura donde se almacene por cada código de pasta,
    la cantidad total vendida durante dicho mes. Esta estructura debe ser la más eficiente en cuanto a la
    búsqueda de un código de pasta en particular.

    b. Creen un programa que muestre un menú de opciones para:
   /*/ • Inicializar las estructuras de datos a utilizar en su funcionamiento. 
   /*/ • Leer una venta e incorporar la información a la estructura generada.
   /*/ • Imprimir la información contenida en la estructura de datos utilizada.
   /*/ • Buscar e informar el código de pasta menos vendido.
   /*/ • Informar los códigos de pasta que tuvieron más de 10 kilos en ventas. 
   
}


program ActividadColaborativa1;
uses crt, SysUtils;

const CODFINAL= '0000';
type
	tipoFecha = record
		dia: 1..31;
		mes: 1..12;
		anio: 2000..2025;
	end;
	
	tipoVenta = record
		codigo: string;
		cantidad: real;
		fecha: tipoFecha;
		cliente: integer;
	end;
	
	// Arbol de enteros
    arbol =   ^nodoA;
    nodoA =   Record
        dato:   tipoVenta;
        HI:   arbol;
        HD:   arbol;
    End;
    
procedure imprimirVenta(elemento: tipoVenta);
	begin
		with elemento do 
					writeln('Codigo: ', codigo,', Cantidad: ', cantidad:2:2, ', Fecha: ', fecha.dia, '/', fecha.mes, '/', fecha.anio, ', cliente numero: ', cliente);
	end;

procedure enOrden(a: arbol);										 //  • Imprimir la información contenida en la estructura de datos utilizada.
begin
  if (a <> nil) then begin
    enOrden(a^.HI);
    imprimirVenta(a^.dato);
    enOrden(a^.HD);
  end;
end;
	
procedure insertarEnRamaArbol (var a: arbol; elemento: tipoVenta);   //  • Leer una venta e incorporar la información a la estructura generada.
	begin
		if (a = nil) then begin
					new(a);
					a^.dato:= elemento;
					a^.HD:= nil;
					a^.HI:= nil;
		end else
			if (a^.dato.cantidad > elemento.cantidad) then insertarEnRamaArbol(a^.HI, elemento)
			else insertarEnRamaArbol(a^.HD, elemento);
	end;

procedure leerVenta(var elemento: tipoVenta; var fin: boolean);
	begin
		with elemento do begin
			writeln('Insertar Codigo de la venta: '); readln(codigo);
			if (codigo = CODFINAL) then fin:= true
				else begin
					writeln('Insertar Cantidad vendida: ');readln(cantidad);
					writeln('Insertar Dia de la venta: ');readln(fecha.dia);
					fecha.mes:= 3;
					fecha.anio:= 2024;
					writeln('Insertar Numero de cliente: '); readln(cliente);
				end;
		end;
	end;
		
procedure cargarArbol(var a: arbol); 								 //  • Inicializar las estructuras de datos a utilizar en su funcionamiento.
	var
		act: tipoVenta;
		fin: boolean;
	begin
		fin:= false;
		leerVenta(act,fin);
		while not(fin) do begin
			insertarEnRamaArbol(a, act);
			clrscr;
			leerVenta(act, fin);
		end;
	end;
	
Procedure busquedaAcotadaArbol(a: arbol); 							 //  • Informar los códigos de pasta que tuvieron más de 10 kilos en ventas.
	var inf, sup:real; 
	begin
		inf:= 10; sup:= 999999;
		if (a <> nil) then
			if (a^.dato.cantidad >= inf) then
				if (a^.dato.cantidad <= sup) then begin
					write(a^.dato.codigo, ' ');
					busquedaAcotadaArbol(a^.hi);
					busquedaAcotadaArbol(a^.hd);
				end
			else
				busquedaAcotadaArbol(a^.hi)
		else
			busquedaAcotadaArbol(a^.hd);
	end;
	
function verMinArbol(a: arbol): string; 							  // • Buscar e informar el código de pasta menos vendido.
	const retERROR='-1';
	var act: string;
	begin
		if (a = nil) then verMinArbol:= retERROR
			else begin
				act:= verMinArbol(a^.HI);
				if (act = retERROR) then verMinArbol:= a^.dato.codigo
					else verMinArbol:= act;
			end;
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
procedure MenuPrincipal(a:arbol);
	var 
		act: tipoVenta;
		aux: string;
		cerrar, auxB: boolean;
	begin
		cerrar:= false;
		while not(cerrar) do begin
				Writeln('funciones: Inicializar, insertarNuevo, imprimirArbol, menosVendido, masde, fin');
				readln(aux);
				case (uppercase(aux)) of
					'INICIALIZAR': cargarArbol(a);
					'INSERTARNUEVO': begin
										if (a = nil) then writeln('Error estructura no inicializada')
											else begin
												leerVenta(act,auxB);
												insertarEnRamaArbol(a,act);
											end;
									end;
					'IMPRIMIRARBOL': if (a = nil) then writeln('Error estructura no inicializada')
											else begin
													writeln('Estructura de datos:');
													enOrden(a);
												end;
					'MENOSVENDIDO': if (a = nil) then writeln('Error estructura no inicializada')
											else writeln(' - Producto menos vendido: Codigo ',verMinArbol(a));
					'MASDE': if (a = nil) then writeln('Error estructura no inicializada')
											else begin
													writeln('Codigos de productos que vendieron menos de 10kg: ');
													busquedaAcotadaArbol(a);
												end;
					'FIN': cerrar:= true;
					end;
				writeln('Precione cualquier tecla para continuar'); readkey;
				clrscr();
			end;
		end;
var
	a: arbol;
BEGIN
	a:= nil;
	MenuPrincipal(a);
	readkey;
	liberarMemArbol(a);
END.

