{
   Tp2eje2.pas
   
   Copyright 2025 catalina <catalina@LAPTOP-8SDBSQFV>
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   
}


program Tp2.eje3;
uses crt;
type
	regCD = record
		codAutor: integer;
		nomAutor: string;
		nomDisco: String;
		genero: String;
		cantVendida: integer;
	end;
	archCD= file of regCD;

procedure Leer (var arch:archCD; var dato: regCD);
begin
	if (not EOF(arch)) then 
		read(arch,dato)
	else
		dato.codAutor:= 9999;
end;

var
	arch: archCD;
	CD: regCD;
	archText: text;
	totalAutor,totalDisco,codAutorActual: integer;
	generoActual: String;
	
BEGIN
	Assign(arch,'archivoCD.dat');
	Reset(arch);
	Assign(archText,'archivoText.txt');
	Rewrite(archText);
	Leer(arch,CD);
	while  (CD. codAutor <> 9999) do begin
		codAutorActual:= CD.codAutor;
		totalAutor:= 0;
		writeln('Autor: ',CD.nomAutor);
		writeln(archText, 'Autor: ',CD.nomAutor);
		while (CD.codAutor = codAutorActual) do begin
			generoActual:= CD.genero;
			totalDisco:= 0;
			totalAutor:= totalAutor + 1;
			writeln('Genero: ',CD.genero);
			writeln(archText, 'Genero: ',CD.genero);
			while (CD.codAutor = codAutorActual) and (CD.genero = generoActual) do begin
				totalDisco:= totalDisco + 1;
				writeln('NombreDisco: ',CD.nomDisco,' Cant. vendida: ',CD.cantVendida);
				writeln(archText, 'NombreDisco: ',CD.nomDisco,' Cant. vendida: ',CD.cantVendida);
				Leer(arch,CD);
			end;
			writeln('Total Disco: ', totalDisco);
		end;
		writeln('Total Autor: ',totalAutor);
	end;
	close(archText);
	close(arch);
	writeln('Programa finalizado');
END.

