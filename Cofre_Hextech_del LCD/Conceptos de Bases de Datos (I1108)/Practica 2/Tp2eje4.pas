program Tp2.eje3;
uses crt;
const
	FIN= 10000;
type
	detalleCalzado = record
		codCalzado: integer;
		numero: integer;
		cantVendida: string;
	end;
	maestroCalzado = record
		codCalzado: integer;
		numero: integer;
		descripcion: string;
		precioUnitario: real;
		color: string;
		stock: integer;
		stockMin: integer;
	end;
	archDetalleCalzado = file of detalleCalzado;
	archMaestroCalzado = file of maestroCalzado;
	vectorDetalles = array[1..20] of archDetalleCalzado;
	vectorRegDetalles = array[1..20] of detalleCalzado;

procedure CerrarArchivos( var m:archMaestro, var v:archDetalles);
var
	i:integer;
begin

end;
var
	archDetalles: vectorDetalles;
	archMaestro: archMaestroCalzado;
	archText: text;
	maestro: maestroCalzado;
	vdetalles: vectorRegDetalles;
BEGIN
	writeln('Assing de los detalles y maestro');
	Assign(archMaestro,'maestro.dat');
	reset(archMaestro);
	for i:= 0 to i:= 20 do begin
		Assing(v[i],'detalle' + InToString(i) + '.dat');
		reset(v[i]);
		read(v[i],r[i]);
	end;
	while 
end;
END.

