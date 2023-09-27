program Tp3BEj1;
{modulo}
  function Potenciometro(i,n:integer): integer; // get it?
  var cont, pot:integer;
  begin
    cont:=0; pot:=i;
    if (n>1) then for cont:=2 to n do i:=i*pot;
    Potenciometro:=i;
  end;

{Programa}
var i, n:integer;
begin
  i:=0; n:=0;
  Writeln('- Por Favor, introduzca su numero i -'); readln(i);
  Writeln('- Por Favor, introduzca su numero n -'); readln(n);
  Writeln(' - i^n=',Potenciometro(i,n));
  Writeln(' - i^3=',Potenciometro(i,3));
  Writeln(' - 2^n=',Potenciometro(2,n));
  Writeln(' --- Precione enter para cerrar el programa ---'); Readln();
end.

