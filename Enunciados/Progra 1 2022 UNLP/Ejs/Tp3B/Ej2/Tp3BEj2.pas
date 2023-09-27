program Tp3BEj2;
{Modulos}
  function FactorialIsAHellOfADrug(N:integer):integer;
  var cont, res:integer;
  begin
    cont:=0; res:=1;
    for cont:=1 to N do res:= res*cont;
    FactorialIsAHellOfADrug:=res;
  end;
var n, m, res:integer;
begin
  n:=0; m:=0; res:=0;
  Writeln(' Escriba el numero n a calcular su factorial');readln(n);
  Writeln(' - ',n,'!=', FactorialIsAHellOfADrug(n));
  Writeln(' Escriba el numero m a calcular su combinatorio');
  readln(m);
  res:= FactorialIsAHellOfADrug(m) Div (FactorialIsAHellOfADrug(m-n) * FactorialIsAHellOfADrug(n));
  Writeln(' Combinatorio de m y n = ', res);
  Writeln(' ---- Precione enter para cerrar el programa ----');readln();
end.

