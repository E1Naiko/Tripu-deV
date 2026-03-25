{
   tp2ej1.pas
   
		1. El área de recursos humanos de un ministerio administra el personal del mismo
	distribuido en 10 direcciones generales.
	
	Entre otras funciones, recibe periódicamente un archivo detalle de cada una de las
	direcciones conteniendo información de las licencias solicitadas por el personal.
	Cada archivo detalle contiene información que indica: código de empleado, la fecha y
	la cantidad de días de licencia solicitadas.

												 El archivo maestro tiene información de
	cada empleado: código de empleado, nombre y apellido, fecha de nacimiento,
	dirección, cantidad de hijos, teléfono, cantidad de días que le corresponden de
	vacaciones en ese periodo.
	
							   Tanto el maestro como los detalles están ordenados por
	código de empleado. Escriba el programa principal con la declaración de tipos
	necesaria y realice un proceso que reciba los detalles y actualice el archivo maestro
	con la información proveniente de los archivos detalles.
														
															 Se debe actualizar la cantidad
	de días que le restan de vacaciones. Si el empleado tiene menos días de los que
	solicita deberá informarse en un archivo de texto indicando: código de empleado,
	nombre y apellido, cantidad de días que tiene y cantidad de días que solicita.

}


program tp2ej1;
//uses crt;

const
	VALOR_ALTO = 9999;
	NOMBRES_DETALLE: array[1..10] of String = (
		'detalle1.dat',
		'detalle2.dat',
		'detalle3.dat',
		'detalle4.dat',
		'detalle5.dat',
		'detalle6.dat',
		'detalle7.dat',
		'detalle8.dat',
		'detalle9.dat',
		'detalle10.dat'
	);

type
	tipoFecha = record
		dia: 1..30;
		mes: 1..12;
		anio: integer;
	end;
	
	// Tanto el maestro como los detalles están ordenados por código de empleado.
	tipoDetalle = record
		codEmpleado: integer;
		fecha: tipoFecha;
		cantDiasLicenciaSolicitado: integer;
	end;
	
	tipoMaestro = record
		codEmpleado: integer;
		nombre: String[30];
		apellido: String[30];
		fechaNacimiento: tipoFecha;
		direccion: String[30];
		cantHijos: integer;
		telefono: integer;
		cantDiasCorrespondenVacacionesEnPeriodo: integer;
	end;
	
	tipoSalida = record
		codEmpleado: integer;
		nombre: String[30];
		apellido: String[30];
		cantidadDiasQueTiene: integer;
		cantDiasQueSolicita: integer;
	end;
	
	archMaestro = File of tipoMaestro;
	archDetalle = File of archDetalle;
	arregloDetalle = array [1..10] of tipoDetalle;
	
// ------------------------ Modulos ------------------------
	
procedure leerDetalle(var archivo: archDetalle; var dato:tipoDetalle);
	begin
		if (not eof(archivo)) then begin
			read(archivo, dato);
			writeln(dato);
		end else
			dato.codEmpleado:= VALOR_ALTO;
	end;	

procedure minimo(var detalles: archDetalle; var regDetalle: arregloDetalle; var min: tipoDetalle);
	var
		posMin: integer;
	begin
		posMin:=1;
		min:= regDetalle[1];
		for i:=2 to 10 do begin
			if (regDetalle[i].codEmpleado < min.codEmpleado) then begin
				min:= regDetalle[i];
				posMin:= i;
			end;
		end;
		leer(detalles[posMin], regDetalle[posMin]);
	end;

// ------------------------ Ppal ------------------------	
var
	i: integer;
	maestro: archMaestro;
	detalles: archDetalle;
	arrDetalles: arregloDetalle;
	min, act: tipoDetalle;
	
BEGIN
	assign(maestro, 'maestro.dat');
	for i:=1 to 10 do assign(detalles[i], NOMBRES_DETALLE[i]);
	
	reset(maestro);
	for i:=1 to 10 do reset(detalles[i]);
	
	minimo(detalles, arrDetalles, min);
	
	while (min.codEmpleado <> VALOR_ALTO) do begin
		act.codEmpleado:= min.codEmpleado;
		act.
	end; 
	
	close(maestro);
	for i:=1 to 10 do close(detalles[i]);
END;
END.

