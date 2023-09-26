{
   
   8. a) Escriba un módulo que reciba un carácter que debe ser un operador matemático ('*', '+', '-', '/') y
dos números enteros, y devuelva el resultado de realizar la operación matemática entre los dos
números recibidos. En caso de que el carácter no sea uno de los operadores matemáticos
indicados, el módulo debe devolver el valor -1.
b) Utilizando el módulo implementado en a), implemente un programa que lea el operador y los dos
operandos, e imprima el resultado de dicha operación.
   
}


program Tp3Ej;
uses crt{, SysUtils};
const
	error=-1;
	
// MODULOS
	function calculadora(op:char; n1, n2: integer): real;
	{
	* a) Escriba un módulo que reciba un carácter que debe ser un operador matemático ('*', '+', '-', '/') y
dos números enteros, y devuelva el resultado de realizar la operación matemática entre los dos
números recibidos. En caso de que el carácter no sea uno de los operadores matemáticos
indicados, el módulo debe devolver el valor -1.
	* }
	var
		res:real;
	begin
		res:=error;
		// pensaba hacer esto con un conjunto pero despues paso a tener que usar un case asi que no tiene sentido
		case op of
				'*' : res:= n1 * n2;
				'+' : res:= n1 + n2;
				'-' : res:= n1 - n2;
				'/' : res:= if (n2=0) then n1 / n2
				               else res:= error;
			else res:= error;
		end;
		calculadora:= res;
		end;

// Programa Principal
	
{
* b) Utilizando el módulo implementado en a), implemente un programa que lea el operador y los dos
operandos, e imprima el resultado de dicha operación.
* }
var 
	operador: char;
	n1,n2:integer;
	
begin
	// Inicio variables
	clrscr;
	writeln(' - Introduzca un operador :'); read(operador);
	writeln(' - Introduzca un numero entero:'); read(n1);
	writeln(' - Introduzca otro numero entero :'); read(n2);
	clrscr;
	
	// invoco al modulo e imprimo
	writeln(' ---- Resultado: ', calculadora(operador,n1,n2):2:2);
	
end.

