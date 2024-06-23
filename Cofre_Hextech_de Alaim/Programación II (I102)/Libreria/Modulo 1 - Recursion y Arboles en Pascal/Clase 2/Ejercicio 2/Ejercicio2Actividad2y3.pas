program Ejercicio2Actividad2y3;

Function potencia1 (x,n: integer): real;
begin
  potencia1 := x * potencia1(x,n-1)
end;

Function potencia2 (x,n: integer): real;
begin
  if (n = 0) then potencia2 := 1
		else potencia2 := x * potencia2(x,n-1);
end;

{PROGRAMA PRINCIPAL}
var
   n, x: integer;

begin

     write ('Ingrese base: ');
     Readln (n);
     write ('Ingrese exponente: ');
     Readln (x);
     
     writeln(n,'^',x,'=',potencia2(n,x):2:2);

     readln;
end.
