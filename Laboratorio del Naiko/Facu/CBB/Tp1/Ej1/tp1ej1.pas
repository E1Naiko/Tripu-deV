	{
	   tp1ej1.pas
	   
			Esta práctica permite ejercitar los diferentes modos de creación y apertura de archivos.
		Definir tipos de datos para un archivo binario y un archivo de texto como así también,
		utilizar como parámetros los archivos. Agregar o modificar información de un archivo
		binario. Leer y escribir tanto en archivo binario como en archivo de texto.
		Siempre que se crea un archivo de texto, tenga en cuenta las limitaciones para
		poder leerlo desde el programa a futuro, siempre se tiene que crear un archivo
		válido.
		
		1. Realizar un programa que permita crear un archivo binario de strings conteniendo
		información de nombres de materiales de construcción, el archivo no es ordenado.
		Efectúe la declaración de tipos correspondiente y luego realice un programa que
		permita la carga del archivo con datos ingresados por el usuario. El nombre del
		archivo debe ser proporcionado por el usuario. La carga finaliza al procesar el
		nombre ‘cemento’ que debe incorporarse al archivo.
		
	}
	
	
	program tp1ej1;
	
	uses crt;
	
	const
		FIN : String = 'cemento';
	
	type
		Archivo = File of String;
	
	procedure leerNuevo(var res: String);
	begin
		writeln('Inserte el siguiente nombre de material de contruccion');
		readln(res);
	end;
	
	procedure imprimirContenido(var arch: Archivo);
	var
		act: String;
		i: integer;
		
	begin
		act:='';
		i:= 0;
		writeln('Elementos cargados:');
		while (not eof(arch)) do begin
			i:= i+1;
			Read(arch, act);
			writeln(i, ': ', act);
		end;
	end;
	
	var
		act: String;
		arch: Archivo;
	
	BEGIN	
		Assign(arch, 'tp1ej1arch1');
		Rewrite(arch);
		writeln('Tp1Ej1');
		leerNuevo(act);
		while (act <> FIN) do begin
			Write(arch, act);
			
			leerNuevo(act);
		end;
		Seek(arch, 0);
		imprimirContenido(arch);
		Close(arch);
	END.
	
	
