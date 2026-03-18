{
   tp1ej5.pas
   
		Realizar un programa, con la declaración de tipos correspondientes que permita
	crear un archivo de registros no ordenados con información de especies de flores
	originarias de América. La información será suministrada mediante teclado. De
	cada especie se registra: número de especie, altura máxima, nombre científico,
	nombre vulgar, color y altura máxima que alcanza. La carga del archivo debe
	finalizar cuando se reciba como nombre científico: ’zzz’.
	Además se deberá contar con opciones del programa que posibiliten:
	
	LISTO
	a) Reportar en pantalla la cantidad total de especies y la especie de menor y de
	mayor altura a alcanzar.
	
	LISTO
	b) Listar todo el contenido del archivo de a una especie por línea.
	
	LISTO
	c) Modificar el nombre científico de la especie flores cargada como: Victoria
	amazonia a: Victoria amazónica.
	
	LISTO
	d) Añadir una o más especies al final del archivo con sus datos obtenidos por
	teclado. La carga finaliza al recibir especie “zzz”.
	
	LISTO
	e) Listar todo el contenido del archivo, en un archivo de texto llamado “flores.txt”.
	El archivo de texto se tiene que poder reutilizar.
	
	LISTO
	f) ¿Qué cambiaría en la escritura del archivo de texto si no fuera necesario
	utilizarlo?
		Si no fuese necesario utilizarlo no haria falta que sea un formato de texto
   
}


program tp1ej5;
uses crt;
const
	FIN : String = 'zzz';
	NOMBRE_GUARDADO : String = 'tp1ej5arch';
	NOMBRE_SALIDA : String = 'flores.txt';
	BUSQUEDA_REEMPLAZO : String = 'Victoria amazonia';
	RESULTADO_REEMPLAZO : String = 'Victoria amazónica';

type
	tipoEspecie = record
		numEspecie: integer;
		nombreCientifico: String;
		nombreVulgar: String;
		color: String;
		alturaMax: real;
	end;
	
	setMayus = set of 'A'..'F';
	setMinus = set of 'a'..'f';
	
	Archivo = File of tipoEspecie;
	
// ------------ Modulos ------------

function lecturaEspecie(): tipoEspecie;
	var
		res: tipoEspecie;
	begin
		writeln('Introduzca el nombre cientifico de la especio o ', FIN, ' para terminar');
		readln(res.nombreCientifico);
		
		if (res.nombreCientifico <> FIN) then begin
			writeln(' - Introduzca el nombre vulgar de la especie');
			readln(res.nombreVulgar);
			writeln(' - Introduzca el numero de la especie');
			readln(res.numEspecie);
			writeln(' - Introduzca el color de la especie');
			readln(res.color);
			writeln(' - Introduzca la altura maxima que puede alcanzar la especie');
			readln(res.alturaMax);
		end;
		
		lecturaEspecie:= res;
	end;
	
procedure importarTxt();
	var
		archOut: text;
		act: tipoEspecie;
		var archIn: Archivo;
	begin
		Assign(archIn, NOMBRE_GUARDADO);
		Reset(archIn);
		
		Assign(archOut, NOMBRE_SALIDA);
		rewrite(archOut);
		
		seek(archIn, 0);
		
		while (not eof(archIn)) do begin
			read(archIn, act);
			writeln(archOut, act.nombreCientifico);
			writeln(archOut, act.nombreVulgar);
			writeln(archOut, act.numEspecie);
			writeln(archOut, act.color);
			writeln(archOut, act.alturaMax:5:5);
		end;
		
		close(archIn);
		close(archOut);
	end;

procedure imprimir();
	{
	Listar todo el contenido del archivo de a una especie por línea.
	}
	var
		act: tipoEspecie;
		var archIn: Archivo;
	begin
		Assign(archIn, NOMBRE_GUARDADO);
		Reset(archIn);
		
		Writeln('imprimiendo');
		while (not eof(archIn)) do begin
			read(archIn, act);
			writeln(act.nombreCientifico, ' || ', act.nombreVulgar, ' || ', act.numEspecie, ' || ', act.color, ' || ', act.alturaMax:2:2);
		end;
		
		close(archIn);
	end;

procedure reportarStats();
	{
		Reportar en pantalla la cantidad total de especies y la especie de menor y de
	mayor altura a alcanzar.
	}
	function checkMin(act: real; min: real): real;
		var
			res: real;
		begin
			res := -1;
			if (min<act) then res:=min
			else res:= act;
			
			checkMin:= res;
		end;
		
	function checkMax(act: real; max: real): real;
		var
			res: real;
		begin
			res := -1;
			if (max>act) then res:= max
			else res:= act;
			
			checkMax:= res;
		end;
	var
		i: integer;
		act: tipoEspecie;
		min, max: real;
		archIn: Archivo;
		
	begin
		Assign(archIn, NOMBRE_GUARDADO);
		Reset(archIn);
		
		i:= 0;
		min:= 9999;
		max:=-1;
		
		while (not eof(archIn)) do begin
			read(archIn, act);
			i:= i+1;
			min:= checkMin(act.alturaMax, min);
			max:= checkMax(act.alturaMax, max);
		end;
		
		writeln(' - Total: ', i, ', min: ', min, ', max: ', max,'.');
		
		close(archIn);
	end;
	
procedure agregarAlFinal();
	var
		act: tipoEspecie;
		archIn: Archivo;
	begin
		Assign(archIn, NOMBRE_GUARDADO);
		Reset(archIn);
		
		seek(archIn, FileSize(archIn));
		
		act:= lecturaEspecie();
		while (act.nombreCientifico<> FIN) do begin
			write(archIn, act);
			act:= lecturaEspecie();
		end;
		
		close(archIn);
	end;
	
procedure modificarNombreCientifico();
	var
		act: tipoEspecie;
		busca, reemplazo: String;
		archIn: Archivo;
	begin
		Assign(archIn, NOMBRE_GUARDADO);
		Reset(archIn);
		
		busca:= BUSQUEDA_REEMPLAZO;
		reemplazo:= RESULTADO_REEMPLAZO;
		
		//writeln('Introduzca el elemento a reemplazar:');
		//readln(busca);
		//writeln('Introduzca el reemplazo:');
		//readln(reemplazo);
		
		repeat begin
			read(archIn, act);
		end until ((eof(archIn)) or (busca=act.nombreCientifico));
		
		if (busca=act.nombreCientifico) then begin
					seek(archIn, FilePos(archIn)-1);
					act.nombreCientifico:= reemplazo;
					write(archIn, act);
					writeln('Elemento reemplazado con exito.')
				end
			else
				writeln('Error: elemento no encontrado.');
		close(archIn);
	end;
	
function interfazEntrada(): char;
	var
		act: char;
		salto: boolean;
		rMay: setMayus;
		rMin: setMinus;
	begin
		rMay := ['A'..'F'];
		rMin := ['a'..'f'];
		act:='-';
		salto:= false;
		while (not salto) do begin
			writeln('Ingrese una de las opciones:');
			writeln(' A) Reportar en pantalla la cantidad total de especies y la especie de menor y de mayor altura a alcanzar');
			writeln(' B) Listar todo el contenido del archivo de a una especie por línea.');
			writeln(' C) Modificar el nombre científico de la especie flores cargada como: Victoria amazonia a: Victoria amazónica.');
			writeln(' D) Añadir una o más especies al final del archivo con sus datos obtenidos por teclado. La carga finaliza al recibir especie “zzz”.');
			writeln(' E) Listar todo el contenido del archivo, en un archivo de texto llamado “', NOMBRE_SALIDA,'”.');
			Writeln(' F) Salir.');
			readln(act);
			if ((act in rMay) or (act in rMin)) then
					salto:=true
				else
					writeln('Error: Caracter no encontrado');
		end;
		
		interfazEntrada:= act;
	end;

// ------------ PPAL ------------
var
	act: char;

BEGIN
	act:= interfazEntrada();
	while ((act<>'F') and (act<>'f')) do begin
		case act of
			'A','a': reportarStats();
			'B','b': imprimir();
			'C','c': modificarNombreCientifico();
			'D','d': agregarAlFinal();
			'E','e': importarTxt();
		end;
		
		writeln();
		writeln(' Volviendo a menu principal');
		writeln('--------------');
		writeln();

		act:= interfazEntrada();
	end;
END.

 
