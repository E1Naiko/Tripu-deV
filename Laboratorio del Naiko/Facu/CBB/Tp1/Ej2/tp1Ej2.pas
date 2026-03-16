{
   tp1Ej2.pas
   
		Esta práctica permite ejercitar los diferentes modos de creación y apertura de archivos.
	Definir tipos de datos para un archivo binario y un archivo de texto como así también,
	utilizar como parámetros los archivos. Agregar o modificar información de un archivo
	binario. Leer y escribir tanto en archivo binario como en archivo de texto.
	Siempre que se crea un archivo de texto, tenga en cuenta las limitaciones para
	poder leerlo desde el programa a futuro, siempre se tiene que crear un archivo
	válido.
 
 		Desarrollar un programa que permita la apertura de un archivo binario de números
	enteros no ordenados. La información del archivo corresponde a la cantidad de
	votantes de cada ciudad de la Provincia de Buenos Aires en una elección
	presidencial. Recorriendo el archivo una única vez, informe por pantalla la cantidad
	mínima y máxima de votantes. Además durante el recorrido, el programa deberá
	listar el contenido del archivo en pantalla. El nombre del archivo a procesar debe
	ser proporcionado por el usuario.

}


program tp1Ej2;

uses crt;

type
	Archivo = File of integer;

function checkMin(act: integer; min: integer): integer;
	var
		res: integer;
	begin
		res := -1;
		if (min<act) then res:=min
		else res:= act;
		
		checkMin:= res;
	end;
	
function checkMax(act: integer; max: integer): integer;
	var
		res: integer;
	begin
		res := -1;
		if (max>act) then res:= max
		else res:= act;
		
		checkMax:= res;
	end;

var 
	act, min, max, i: integer;
	arch: Archivo;
	nomArch: String;

BEGIN
	min := 9999;
	max := -1;
	i := 0;
	
	writeln('Introduzca el nombre del archivo');
	readln(nomArch);
	
	assign(arch, nomArch);
	reset(arch);
	
	while (not eof(arch)) do begin
		i:= i+1;
		
		read(arch, act);
		writeln(i, '- ', act);
		
		min:= checkMin(act, min);
		max:= checkMax(act, max);
	end;
	
	writeln('Resultado: min ', min, ', max ', max);
	close(arch);
END.
