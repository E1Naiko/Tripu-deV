program Tp3Pt2Ej2a;
function Fac(var num:integer):integer; // Factorial (numero)
var
   res:integer;
begin
  res:=1;
  while (num<>0) do
        begin
           res:=res*num;
           num:=num-1;
        end;
  Fac:=res;
end;
var
  n,n2:integer;
  loop:integer; //loop
begin
  read(n);
  n2:=n;
  writeln('El Numero ',n2,' Factorizado da como Resultado ',Fac(n));
  read(loop);
end.

