{
   3. * Realizar un programa que lea de teclado un vector de 600 caracteres. Finalizada la carga informar:
	
	a) La cantidad y porcentaje de consonantes sobre el total de caracteres alfabéticos.
	
	b) La cantidad y porcentaje de caracteres que son dígitos, letras mayúsculas, letras minúsculas
	   sobre el total de caracteres ingresados.
}


program tp6Aej3;
uses crt;
const
	DIMF = 600;
type
	subrIndice = 0..DIMF;
	conjCarac = set of Char;
	vector = array [1..DIMF] of char;
	
	cant_y_porc = record
		cant: subrIndice;
		porc: real;
	end;
	cumpleB = record
		dig, mayus, minus: cant_y_porc;
	end;
	
// ------------------------ MODULOS ------------------------
procedure imprimirCantidadyPorcentaje(act: cant_y_porc);
	begin
		with act do begin
			writeln('Cantidad: ', cant);
			writeln('Porcentaje: ', porc:2:2, '%.');
		end;
	end;
	
function calcularPorcentaje(cant, total: integer):real;
	begin
		calcularPorcentaje:= (cant*100)/total;
	end;

procedure cargarVector(var v: vector); // CARGA COMPLETA DEL VECTOR
	var
		i: subrIndice;
	begin
		for i:=1 to DIMF do begin
			writeln(' - Numero ', i, '/', DIMF, ': ');
			readln(v[i]);
		end;
	end;

procedure sonConsonantes(v: vector; consonantes: conjCarac; var ejA: cant_y_porc); // Calculo EJA
	var
		i: subrIndice;
	begin
		ejA.cant:=0;
		// recorro el vector y calculo
		for i:=1 to DIMF do if (v[i] in consonantes) then ejA.cant:= ejA.cant+1;
		ejA.porc:= calcularPorcentaje(ejA.cant, DIMF);
	end;
	
procedure calculoEjercioB(v: vector; minusculas, mayusculas, digitos: conjCarac; var ejB: cumpleB);
	var
		i: subrIndice;
	begin
		with ejB do begin
			minus.cant:=0;
			mayus.cant:=0;
			dig.cant:=0;
			// recorro el vector y calculo cantidad
			for i:=1 to DIMF do begin
				if (v[i] in minusculas) then minus.cant:= minus.cant+1
					else if (v[i] in mayusculas) then mayus.cant:= mayus.cant+1
					else if (v[i] in digitos) then dig.cant:= dig.cant+1;
			
			end;
			
			// calculo todos los porcentajes
			minus.porc:= calcularPorcentaje(minus.cant, DIMF);
			mayus.porc:= calcularPorcentaje(mayus.cant, DIMF);
			dig.porc:= calcularPorcentaje(dig.cant, DIMF);
		end;
	end;
// ------------------------ PROGRAMA PRINCIPAL ------------------------
var
	v: vector;
	consonantes, minusculas, mayusculas, vocales, digitos: conjCarac;
	ejA: cant_y_porc;
	ejB: cumpleB;
BEGIN
	// INICIALIZO
	minusculas:= ['a'..'z'];
	mayusculas:= ['A'..'Z'];
	digitos:= ['0'..'9'];
	vocales:= ['a','e','i','o','u','A','E','I','O','U'];
	consonantes:= (minusculas - vocales) + (mayusculas - vocales);
	
	// MAIN
	cargarVector(v);
	
	sonConsonantes(v, consonantes, ejA);
	writeln('Resultados de consonantes en el conjunto de caracteres:');
	imprimirCantidadyPorcentaje(ejA);
	
	writeln('--------------------------------');
	calculoEjercioB(v, minusculas, mayusculas, digitos, ejB);
	writeln('Resultados de minusculas en el conjunto de caracteres:');
	imprimirCantidadyPorcentaje(ejB.minus);
	writeln('Resultados de mayusculas en el conjunto de caracteres:');
	imprimirCantidadyPorcentaje(ejB.mayus);
	writeln('Resultados de digitos en el conjunto de caracteres:');
	imprimirCantidadyPorcentaje(ejB.dig);
	
END.
