program Ejercicio_1_A;
var
  valor,par,digito:integer;
  loop:integer;
begin
  par:=0;
  read(valor);
  repeat
        digito:= valor mod 10;
        par:= digito mod 2;
        if par=0 then writeln(digito);
        valor:= valor div 10;
  until valor=0;
  read(loop);
end.

