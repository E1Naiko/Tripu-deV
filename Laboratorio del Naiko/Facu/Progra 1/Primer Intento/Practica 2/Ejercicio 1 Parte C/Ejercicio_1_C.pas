program Ejercicio_1_D;
var
  valor,par,digito,contador:integer;
  loop:integer;
begin
  for contador:= 1 to 80 do begin
  par:=0;
  read(valor);
  repeat
        digito:= valor mod 10;
        par:= digito mod 2;
        if par=0 then writeln(digito);
        valor:= valor div 10;
  until valor=0;
  end;
  read(Loop);
end.

