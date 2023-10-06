{
   6. * Defina un tipo de dato que permita almacenar una secuencia de 64 valores binarios e implemente
		módulos que realicen las operaciones AND, OR y NOT (vistas en la práctica de operaciones lógicas),
		junto con dos operandos o uno, según corresponda.
}


program tp6Aej6;
uses crt, SysUtils;
const
	DIMF = 3;
type
	subrIndice = 0..DIMF;
	vector = array [subrIndice] of boolean;
	
// ------------------- MODULOS -------------------
procedure imprimirVector(v: vector);
	var i: subrIndice;
	begin
		write(' = ');
		for i:=0 to DIMF do
			if (v[i]) then write('1 ') else write('0 ');
	end;

procedure cargarVector(var v: vector);
	type
		subrAux = 0..1;
	var
		i: subrIndice;
		aux: subrAux;
		ok: boolean;
	begin
		for i:=0 to DIMF do begin
			writeln(' Valor booleano ', i, '/', DIMF, ': ');
			
			// TOTALMENTE OPCIONAL:
			// basicamente pregunto desde teclado si quiero que sea 0 o 1 y le asigno la condicion correspondiente a v[i]
			ok:=false;
			repeat begin
				writeln('INTRODUZCA "1" O "0" PARA APLICARLE SU OPERACION');
				readln(aux);
				if (aux=1) or (aux=0) then ok:=true
					else writeln('ERROR');
			end until ok;
			v[i]:= aux=1;
		end;
	end;
	
procedure compuertaAND(op1, op2: vector; var res: vector);
	var i: subrIndice;
	begin
		for i:=0 to DIMF do res[i]:= op1[i] and op2[i];
	end;

procedure compuertaOR(op1, op2: vector; var res: vector);
	var i: subrIndice;
	begin
		for i:=0 to DIMF do res[i]:= op1[i] or op2[i];
	end;

procedure compuertaNOT(op: vector; var res: vector);
	var i: subrIndice;
	begin
		for i:=0 to DIMF do res[i]:= not(op[i]);
	end;

procedure calcularNOT(op1, op2: vector; var res: vector);
	type
		cadena = string[3];
	var
		aux: cadena;
		ok: boolean;
	begin
		ok:=false;
		repeat begin
			writeln('INTRODUZCA "OP1" O "OP2" PARA APLICARLE SU OPERACION');
			readln(aux);
			aux:= UpperCase(aux);
			if (aux = 'OP1') or (aux='OP2') then ok:=true
				else writeln('ERROR');
		end until ok;
		if (aux='OP1') then compuertaNOT(op1, res)
			else compuertaNOT(op2, res)
	end;
// ------------------- PROGRAMA PRINCIPAL -------------------
var
	op1, op2, resAND, resOR, resNOT: vector;
BEGIN
	writeln('Introduzca el operador 1:');
	cargarVector(op1);
	write('OP1'); imprimirVector(op1);
	writeln();
	writeln('Introduzca el operador 2:');
	cargarVector(op2);
	write('OP2'); imprimirVector(op2);
	writeln('---------------------------------------------------------');
	
	writeln('Operador1 AND Operador2');
	compuertaAND(op1,op2,resAND);
	imprimirVector(resAND);
	
	writeln();
	
	writeln('Operador1 OR Operador2');
	compuertaOR(op1,op2,resOR);
	imprimirVector(resOR);
	
	writeln();
	
	calcularNOT(op1,op2, resNOT); // tengo un procedure aparte para hacer el selector de operandos, no lo pide el ej
	imprimirVector(resNOT);
	writeln();
	writeln('---------------------------------------------------------');
	readkey;
END.

