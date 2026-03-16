{
   tp1ej4.pas
   
		Esta práctica permite ejercitar los diferentes modos de creación y apertura de archivos.
	Definir tipos de datos para un archivo binario y un archivo de texto como así también,
	utilizar como parámetros los archivos. Agregar o modificar información de un archivo
	binario. Leer y escribir tanto en archivo binario como en archivo de texto.
	Siempre que se crea un archivo de texto, tenga en cuenta las limitaciones para
	poder leerlo desde el programa a futuro, siempre se tiene que crear un archivo
	válido.
   
		Crear un procedimiento que reciba como parámetro el archivo del punto 2, y
	genere un archivo de texto con el contenido del mismo.
   
}


program tp1ej4;

uses crt;

type
	Archivo = File of integer;

procedure leerArchivo(var archIn: Archivo);
	var
		act, i: integer;
		archOut: text;
		
	begin
		i := FilePos(archIn);
		assign(archOut, 'tp1ej4txt.txt');
		rewrite(archOut);
	
		while (not eof(archIn)) do begin
			read(archIn, act);
			writeln(archOut, act);
		end;
		
		seek(archIn, i);
		close(archOut);
	end;
	
var 
	i: integer;
	archIn: Archivo;

BEGIN
	assign(archIn, 'tp1ej2arch');
	reset(archIn);
	
	//read(archIn, i);
	//writeln(' 1) ', i);
	
	leerArchivo(archIn);
	
	//while (not eof(archIn)) do begin
	//	read(archIn, i);
	//	writeln(i);
	//end;
	
	close(archIn);
END.

