program Ejercicio_1_B;
var
  valor,par,mayor,digito:integer;
  loop:integer;
begin
  par:=0;
  read(valor);
  mayor:=0;
  repeat
        digito:= valor mod 10;
        par:= digito mod 2;
        if par=0 then writeln(digito);
        valor:= valor div 10;
        if digito>mayor then mayor:=digito;
  until valor=0;
  writeln('Digito Mayor es ', mayor);
  read(loop);
end.

