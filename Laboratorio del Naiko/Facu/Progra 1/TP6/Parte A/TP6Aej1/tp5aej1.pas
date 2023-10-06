{
   1. * Realizar un programa que implemente y use:

	a) un módulo que cargue un vector con 50 números enteros y lo retorne.
	
	b) un módulo que reciba el vector generado en a) y retorne el promedio de sus valores y el
		porcentaje de números negativos y positivos.
	
	c) un módulo que reciba el vector generado en a) y dos valores enteros que representan un rango de
		valores y que retorne la cantidad de elementos del vector que estén dentro de ese rango.
	
	d) un módulo que reciba el vector generado en a) y retorne los dos valores máximos entre sus
		elementos junto con la posición donde se encuentran.
   
}


program tp6Aej1;

uses crt;
const
	DIMF = 5;
type
	subrIndice = 0..DIMF;
	vector = array [1..DIMF] of integer;
	extremos = record
		pos: subrIndice;
		val: integer;
	end;
// ------------------- MODULOS -------------------

procedure cargarVector(var v: vector); // CARGA COMPLETA DEL VECTOR
	var
		i: subrIndice;
	begin
		for i:=1 to DIMF do begin
			writeln(' - Numero ', i, '/', DIMF, ': ');
			readln(v[i]);
		end;
	end;
	
procedure promediar_numPos_y_numNeg(v: vector; var prom: real; var nPos, nNeg: integer);
	var
		i: subrIndice;
		sum: integer;
	begin
		sum:=0; nPos:=0; nNeg:=0;
		for i:=1 to DIMF do begin
			sum:= sum + v[i];
			if (v[i]>=0) then nPos:= nPos+1
				else nNeg:= nNeg+1;
		end;
		prom := sum / DIMF;
	end;
	
procedure enRango(v: vector; rmin, rmay: integer; var resultado: subrIndice);
	var
		i: subrIndice;
	begin
		resultado:=0;
		resultado:=0;
		for i:=1 to DIMF do begin
			if (v[i] >= rmin) and (v[i] <= rmay) then resultado:= resultado+1;
		end;
	end;
	
procedure encontrarMax(v: vector; var max1, max2: extremos);
	var
		i: subrIndice;
	begin
		max1.pos:=0; max1.val:=-9998;
		max2.pos:=0; max2.val:=-9999;
		
		for i:=1 to DIMF do begin
			if (v[i] > max1.val) then begin
					max2:= max1;
					max1.pos:= i;
					max1.val:= v[i];
			end else if (v[i] > max2.val) then begin
					max2.pos:= i;
					max2.val:= v[i];
			end;
		end;
	end;
// ------------------- PROGRAMA PRINCIPAL -------------------
var
	v: vector; {EjA}
	prom: real; {EjB}
	res: subrIndice; {EjC}
	nPos, nNeg {EjB}, rMin, rMay {EjC}: integer;
	max1, max2 {EjD}: extremos;
BEGIN
	clrscr;
	cargarVector(v);
	
	writeln('PROMEDIANDO NUMEROS Y CALCULANDO LA CANTIDAD DE NUMEROS POSITIVOS Y NEGATIVOS');
	promediar_numPos_y_numNeg(v, prom, nPos, nNeg);
	writeln(' - Promedio: ', prom:2:2);
	writeln(' - Cantidad de numeros positivos: ', nPos);
	writeln(' - Cantidad de numeros negativos: ', nNeg);
	
	writeln;
	
	writeln('INTRODUZCA UN RANGO PARA DETERMINAR CUANTOS NUMEROS SE ENCUENTRAN DENTRO DE EL');
	writeln(' - Principio del rango:'); readln(rMin);
	writeln(' - Final del rango:'); readln(rMay);
	enRango(v,rMin,rMay, res);
	writeln('Cantidad de numeros que se encuentran dentro del rango: ', res);
	
	writeln;
	
	writeln('CALCULANDO LOS 2 NUMEROS MAYORES Y SUS POSICIONES');
	encontrarMax(v, max1, max2);
	with max1 do writeln('El mayor numero encontrado es ', val, ' en la posicion ', pos, '.');
	with max2 do writeln('El segundo mayor numero encontrado es ', val, ' en la posicion ', pos, '.');
END.

