program Ejercicio4;
var
  numero,invertido,digito,contador:integer;
  loop:integer;
begin
  invertido:=0;
  digito:=0;
  read(numero);
  contador:=numero;
  while contador>0 do
        begin
        digito:=numero mod 10;
        invertido:=(invertido*10)+digito;
        contador:=(contador-digito) div 10;
        numero:=(numero-digito) div 10;
        end;
  writeln('numero invertido ', invertido);
  read(loop);
end.

