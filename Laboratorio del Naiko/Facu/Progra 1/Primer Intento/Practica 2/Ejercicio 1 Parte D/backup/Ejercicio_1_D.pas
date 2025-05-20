program Ejercicio_1_D;
var
  valor,par,digito,suma:integer;
  loop:integer;
begin
  par:=0;
  suma:=0;
  read(valor);
  repeat
    digito:= valor mod 10;
    par:= digito mod 2;
    if par=0 then writeln(digito);
    valor:= valor div 10;
    suma:=suma+digito;
    until valor=0;
  while suma<19 do begin
    par:=0;
    suma:=0;
    read(valor);
    repeat
      digito:= valor mod 10;
      par:= digito mod 2;
      if par=0 then writeln(digito);
      valor:= valor div 10;
      suma:=suma+digito;
      until valor=0;
  end;
  read(loop);
end.

