{
* 11.* Dado el siguiente programa: informar que imprime en cada caso
* }
program Tp3Ej11;
var alfa, beta, gama, epsilon: integer;
procedure calcular(alfa: integer; var gama: integer; var beta:integer;
var epsilon: integer);
 begin
	alfa:= beta - 1 ;
	beta:= alfa + 8;
	gama:= beta + 15;
	epsilon:= beta - gama;
	writeln(alfa, ' ',beta, ' ',gama, ' ',epsilon);
 end;
begin
 alfa:= 6; beta:= 13; gama:= -6; epsilon:= 2;
 calcular(epsilon, alfa, beta, gama);
 writeln(alfa, ' ',beta, ' ',gama, ' ',epsilon);
end.
