
{
        La empresa se encuentra desarrollando un sistema de versionado de un
    documento. Para esto, se guardan hasta un máximo de 40 versiones del
    documento. De cada versión se conoce, el título, un link al texto completo y
    la fecha en formato UNIX (un entero). Esta información se encuentra ordenada
    por fecha. Se nos asigna desarrollar:

    1. Un método que reciba las últimas
        versiones de un documento, y una fecha en formato UNIX, y retorne la versi�
        �n correspondiente a esa fecha. En caso de no encontrar una versión retornar
        una versión con título “Inexistente”.

    2. Modificar el método del punto anterior
        para que, en caso de no encontrar la versión, devolver la versión
        con la fecha más cercana.
}

Program tp6ADDej3;

Uses crt, SysUtils;

Const 
    DIMF =   40;

Type 
    subrIndice =   0 .. DIMF;
    cadena =   string;
    tipoVersion =   Record
        titulo, link:   cadena;
        fecha:   integer;
    End;
    arrVersiones =   array [1..DIMF] Of tipoVersion;
    tipoDocumento =   Record
        dimL:   subrIndice;
        vec:   arrVersiones;
    End;
// ----------------------------- MODULOS ILEGALES -----------------------------
procedure ImprimirArreglo(documento: tipoDocumento);
	var
		i: subrIndice;
	begin
		writeln('Contenido del arreglo:');
		for i := 1 to documento.dimL do
		begin
			writeln('Elemento ', i);
			writeln('Título: ', documento.vec[i].titulo);
			writeln('Link: ', documento.vec[i].link);
			writeln('Fecha: ', documento.vec[i].fecha);
			writeln;
		end;
	end;

procedure CargarVecAleatoriamente(var documento: tipoDocumento);
	var
		i: subrIndice;
	begin
		// Inicializa el generador de números aleatorios
		randomize;
		
		// Carga el arreglo con valores aleatorios
		for i := 1 to documento.dimL do
		begin
			documento.vec[i].titulo := 'Título ' + IntToStr(i);
			documento.vec[i].link := 'http://ejemplo.com/' + IntToStr(i);
			documento.vec[i].fecha := random(2100000000); // Fecha aleatoria en formato Unix Epoch
		end;
	end;
procedure OrdenarPorFecha(var documento: tipoDocumento);
	var
	i, j: subrIndice;
	temp: tipoVersion;
	begin
		for i := 1 to documento.dimL - 1 do
			begin
			for j := 1 to documento.dimL - i do
			begin
				if documento.vec[j].fecha > documento.vec[j + 1].fecha then
				begin
					// Intercambia los elementos si están en el orden incorrecto
					temp := documento.vec[j];
					documento.vec[j] := documento.vec[j + 1];
					documento.vec[j + 1] := temp;
				end;
			end;
		end;
	end;

procedure CargarYOrdenarVecAleatoriamente(var documento: tipoDocumento);
	begin
	randomize;
	documento.dimL:= random(40)+1;
	CargarVecAleatoriamente(documento);
	
	// Llama a la función de ordenación por fecha
	OrdenarPorFecha(documento);
	writeln('Versiones Ordenadas:');
	ImprimirArreglo(documento);
	end;


// ----------------------------- MODULOS -----------------------------
procedure devVercionA(v: tipoDocumento; var encontre: boolean; var dev: tipoVersion);
	var
	begin
	end;
	
procedure devVercionB(v: tipoDocumento; var encontre: boolean; var dev: tipoVersion);
	var
	begin
	end;
// ----------------------------- PROGRAMA PRINCIPAL -----------------------------
var
	Documentos: tipoDocumento;
Begin
	clrscr;
	CargarYOrdenarVecAleatoriamente(Documentos)
End.
