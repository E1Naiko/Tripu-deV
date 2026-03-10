{
Desarrollar un programa que permita la apertura de un archivo binario de números
enteros no ordenados. 
La información del archivo corresponde a la cantidad de
votantes de cada ciudad de la Provincia de Buenos Aires en una elección
presidencial. 
Recorriendo el archivo una única vez, informe por pantalla la cantidad
mínima y máxima de votantes.
Además durante el recorrido, el programa deberá listar el contenido del archivo en pantalla. 
El nombre del archivo a procesar debe ser proporcionado por el usuario 
}

program ejercicio2;
type
	Archivo = file of Integer;
	

procedure crearArchivo(var arch: Archivo);
var
	aux:integer;
begin
	aux:=0;
	while (aux <> -1) do begin
		writeln ('Ingrese cantidad de votos');
		readln(aux);
		if(aux <> -1) then
			Write(arch,aux);
	end;
end;

procedure leerVoto(var arch: Archivo);
var
	voto:integer;
	max:integer;
	min:integer;
begin
	max:= -1;
	min:= 9999;
	while (not eof(arch)) do begin
		Read(arch,voto);
		if (voto<min) then begin
			min:=voto;
		end;
		if (voto>max) then begin 
			max:=voto;
		end;
	end;
	writeln('Cantidad de votos Maxima: ', max);
	writeln('Cantidad de votos Minima: ', min);
end;

var
	arch: Archivo;	
BEGIN	
	Assign(arch, 'tp1ej1arch2');
	Rewrite(arch);
	writeln('Tp1Ej2');
	crearArchivo(arch);
	writeln('<---Votos Minimo y Maximo --->');
	//Seek (arch,0);
	leerVoto(arch);
	Close(arch);
END.
