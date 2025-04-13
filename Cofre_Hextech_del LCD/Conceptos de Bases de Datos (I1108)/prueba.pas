program prueba;
uses crt;
type
	registro = record
		hola: integer;
		xd: string;
	end;
	gos =file of integer;
var 
arch: gos;
cant: integer;
BEGIN
	cant:= 0;
	assign(arch,'Dato.dat');
	rewrite(arch);
	read(cant);
	while ( cant<>0) do begin
		write(arch,cant);
		read(cant);
	end;
	close(arch);
	writeln('Hola, tu nariz contra mi bolas: ', cant);
END.

