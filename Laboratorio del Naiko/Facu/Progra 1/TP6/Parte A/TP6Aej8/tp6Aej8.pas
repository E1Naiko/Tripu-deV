{
	8. * Implementar 2 versiones de un módulo que cuente la cantidad de palabras que hay en un arreglo
	de caracteres con un máximo de 150 caracteres:
		a) Implementar una versión del módulo que tenga en cuenta una dimensión lógica para indicar la
	posición del último carácter.
		b) Implementar una versión del módulo que asuma que el último carácter es punto.
	
	Nota: en ambos casos, por seguridad, realice las verificaciones para no pasarse de la longitud
	máxima
	
	PARA TESTEO USÉ LA SIGUIENTE FRASE:
	Cada dia sabemos mas y entendemos menos. Don Ramon.
	         |10car    |20car    |30car    |40car    |50car
										   |7pal      |9pal

	EN AMBOS CASOS USE EL MISMO DISEÑO:
	* 1ero: me salteo todos los blancos
	* 2do: recorro todos los caracteres hasta encontrar un blanco o el fin, lo cual cuento como 1 palabra
	* 3ero: repito
										   
}

program tp6Aej8;
const
	DIMF = 150;
	FIN = '.';
type
	subrIndice = 0..DIMF;
	arrVector = array [1..DIMF] of char;
	tipoVector = record
		dimL: subrIndice;
		v: arrVector;
	end;
	
// ------------------------- MODULOS ILEGALES -------------------------
// 	son unicamente para la carga de datos y prueba del programa, fueron copiados directamente de chatgpt
// 	y solo adapte las variables y parametros a como los tengo declarados
procedure cargarFraseEnVector(var vector: tipoVector; frase: string);
	var
	i: subrIndice;
	begin
	if Length(frase) > DIMF then
	begin
		writeln('La frase es demasiado larga para cargar en el vector.');
		exit;
	end;
	
	vector.dimL := Length(frase);
	
	for i := 1 to vector.dimL do
		vector.v[i] := frase[i];
	end;

procedure ImprimirVector(vector: tipoVector);
	var
		i: subrIndice;
	begin
		Writeln('VECTOR:');
		for i := 1 to vector.dimL do
		begin
			Write(vector.v[i]);
			if vector.v[i] = '.' then
			Break; // Si encontramos '.', terminamos la impresión
		end;
		Writeln;
	end;
// ------------------------- MODULOS -------------------------
procedure recorrerVectorA(vector: tipoVector; var devPos: subrIndice; var devCantPalabras: integer);
	procedure descartarBlancos(var act: tipoVector; var i: subrIndice);
		begin
			while (act.v[i]=' ') and (i<act.dimL) do
				i:= i+1;
		end;
		
	procedure recorrerPalabra(var act: tipoVector; var i: subrIndice);
		begin
			while (act.v[i]<>' ') and (i<act.dimL) do
				i:= i+1;
		end;
	
	// MAIN DE recorrerVector
	var
		i: subrIndice;
	begin
		devPos:=0; devCantPalabras:=0; i:=1;
		while (i < vector.dimL) do begin
			descartarBlancos(vector, i);
			devCantPalabras:= devCantPalabras+1;
			recorrerPalabra(vector, i)
		end;
		devPos:= i;
	end;

procedure recorrerVectorB(vector: tipoVector; var devPos: subrIndice; var devCantPalabras: integer);
	procedure descartarBlancos(var act: tipoVector; var i: subrIndice);
		begin
			while (act.v[i]=' ') and (act.v[i]<>fin) and (i<act.dimL) do
				i:= i+1;
		end;
		
	procedure recorrerPalabra(var act: tipoVector; var i: subrIndice);
		begin
			while (act.v[i]<>' ') and (act.v[i]<>fin) and (i<act.dimL) do
				i:= i+1;
		end;
	
	// MAIN DE recorrerVector
	var
		i: subrIndice;
	begin
		devPos:=0; devCantPalabras:=0; i:=1;
		while (i < vector.dimL) and (vector.v[i]<>fin) do begin
			descartarBlancos(vector, i);
			devCantPalabras:= devCantPalabras+1;
			recorrerPalabra(vector, i)
		end;
		devPos:= i;
	end;
// ------------------------- PROGRAMA PRINCIPAL -------------------------
var
	// variables necesarias para los modulos ilegales
	miFrase: string;

	vector: tipoVector;
	devPos: subrIndice;
	devCantPalabras: integer;
BEGIN
	// simular carga de datos
	writeln('Ingrese la frase que desea cargar en el vector:');
	readln(miFrase);
	cargarFraseEnVector(vector, miFrase);
	ImprimirVector(vector);
	
	// programa real
	recorrerVectorA(vector, devPos, devCantPalabras);
	writeln(' - RESULTADOS A - Posicion final: ', devPos, ', cantidad de palabras: ', devCantPalabras);
	
	recorrerVectorB(vector, devPos, devCantPalabras);
	writeln(' - RESULTADOS B - Posicion final: ', devPos, ', cantidad de palabras: ', devCantPalabras);
	
END.

