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
const
	FIN= 10000;
type
	especies = record
		codEspecie: integer;
		nomVulgar: string;
		nomCientifico: string;
		alturaProm: real;
		descripcion: string;
		zonaGeografica: string;
	end;
	archEspecies = file of especies;

procedure BorrarEspecie (var a: arch, esp:especie):
var
	posicionBorrar:integer;  rp,aux,aux2:especies; 
begin
	reset(a);
	readln(nombre);
	rp.nomVulgar='zzz';
end;
var
	arch: archEspecies;
	esp: especies;
	archText: text;
	totalAutor,totalDisco,codAutorActual: integer;
	generoActual: String;
	
BEGIN
	
END.

