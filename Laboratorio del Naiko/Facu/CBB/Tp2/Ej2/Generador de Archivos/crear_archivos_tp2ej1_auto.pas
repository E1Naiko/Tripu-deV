program tp2ej1_menu;
uses crt;

const
	dimF = 10;

type
	tipoFecha = record
		dia: 1..30;
		mes: 1..12;
		anio: integer;
	end;
	
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

var
	mae: file of tipoMaestro;
	det: file of tipoDetalle;

// ------------------------ GENERAR MAESTRO ------------------------

procedure generarMaestro();
var regM: tipoMaestro;
	i: integer;
begin
	assign(mae, 'maestro.dat');
	rewrite(mae);

	for i := 1 to 15 do begin
		regM.codEmpleado := i;
		
		str(i, regM.nombre);
		regM.nombre := 'Nombre' + regM.nombre;
		
		str(i, regM.apellido);
		regM.apellido := 'Apellido' + regM.apellido;
		
		regM.fechaNacimiento.dia := random(30) + 1;
		regM.fechaNacimiento.mes := random(12) + 1;
		regM.fechaNacimiento.anio := 1980 + random(25);
		
		str(i, regM.direccion);
		regM.direccion := 'Calle ' + regM.direccion;
		
		regM.cantHijos := random(4);
		regM.telefono := 100000 + random(900000);
		
		regM.cantDiasCorrespondenVacacionesEnPeriodo := 10 + random(20);

		write(mae, regM);
	end;

	close(mae);
end;

// ------------------------ GENERAR DETALLE ------------------------

procedure generarDetalle(nombre: string);
var regD: tipoDetalle;
	cod: integer;
begin
	assign(det, nombre);
	rewrite(det);

	cod := 1 + random(3);

	while (cod <= 15) do begin
		regD.codEmpleado := cod;
		
		regD.fecha.dia := random(30) + 1;
		regD.fecha.mes := random(12) + 1;
		regD.fecha.anio := 2025;
		
		regD.cantDiasLicenciaSolicitado := 1 + random(15);

		write(det, regD);

		cod := cod + (1 + random(3));
	end;

	close(det);
end;

// ------------------------ IMPRIMIR MAESTRO ------------------------

procedure imprimirMaestro();
var regM: tipoMaestro;
begin
	assign(mae, 'maestro.dat');
	reset(mae);

	writeln('--- MAESTRO ---');
	while not eof(mae) do begin
		read(mae, regM);
		writeln('Cod: ', regM.codEmpleado,
		        ' | Nombre: ', regM.nombre, ' ', regM.apellido,
		        ' | Vacaciones: ', regM.cantDiasCorrespondenVacacionesEnPeriodo);
	end;

	close(mae);
end;

// ------------------------ IMPRIMIR DETALLE ------------------------

procedure imprimirDetalle(nombre: string);
var regD: tipoDetalle;
begin
	assign(det, nombre);
	reset(det);

	writeln('--- ', nombre, ' ---');
	while not eof(det) do begin
		read(det, regD);
		writeln('Cod: ', regD.codEmpleado,
		        ' | Fecha: ', regD.fecha.dia, '/', regD.fecha.mes, '/', regD.fecha.anio,
		        ' | Dias solicitados: ', regD.cantDiasLicenciaSolicitado);
	end;

	close(det);
end;

// ------------------------ MENU ------------------------

procedure menu();
var
	op: integer;
	i: integer;
	nombreArchivo: string;
begin
	repeat
		clrscr;
		writeln('==== MENU ====');
		writeln('1. Generar archivos');
		writeln('2. Mostrar maestro');
		writeln('3. Mostrar detalles');
		writeln('0. Salir');
		write('Opcion: ');
		readln(op);

		clrscr;

		case op of
			1: begin
				randomize;
				generarMaestro();
				for i := 1 to dimF do begin
					str(i, nombreArchivo);
					nombreArchivo := 'detalle' + nombreArchivo + '.dat';
					generarDetalle(nombreArchivo);
				end;
				writeln('Archivos generados.');
			end;

			2: imprimirMaestro();

			3: begin
				for i := 1 to dimF do begin
					str(i, nombreArchivo);
					nombreArchivo := 'detalle' + nombreArchivo + '.dat';
					imprimirDetalle(nombreArchivo);
					writeln;
				end;
			end;
		end;

		writeln;
		writeln('Presione ENTER para continuar...');
		readln;
	until op = 0;
end;

// ------------------------ MAIN ------------------------

begin
	menu();
end.
