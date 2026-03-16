{
   tp1Ej3.pas
   
	Esta práctica permite ejercitar los diferentes modos de creación y apertura de archivos.
	Definir tipos de datos para un archivo binario y un archivo de texto como así también,
	utilizar como parámetros los archivos. Agregar o modificar información de un archivo
	binario. Leer y escribir tanto en archivo binario como en archivo de texto.
	Siempre que se crea un archivo de texto, tenga en cuenta las limitaciones para
	poder leerlo desde el programa a futuro, siempre se tiene que crear un archivo
	válido.
	
	Realizar un programa que permita crear un archivo de texto. El archivo se debe
	cargar con la información ingresada mediante teclado. La información a cargar
	representa los tipos de dinosaurios que habitaron en Sudamérica. La carga finaliza
	al procesar el nombre ‘zzz’ que no debe incorporarse al archivo.
   
}


program tp1Ej3;
uses crt;
const
	FIN: String = 'zzz';

var 
	arch: text;
	act: String;
	act: integer;

BEGIN
	assign(arch, 'tp1ej3txt.txt');
	rewrite(arch);
	
	writeln('Introduzca un fokin nombre de fokin dinosaurio');
	readln(act);
	
	repeat begin
		writeln(arch, act);
		writeln('Introduzca un nombre de dinosaurio o zzz para terminar');
		readln(act);
	end
	until (act=FIN);
	close(arch);
END.

